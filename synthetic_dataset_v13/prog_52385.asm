; DESCRIPTION: Draws a black line from (97, 28) to (94, 183).
; PLAN: r0=97(x1), r1=28(y1), r2=94(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 28
LDI r2, 94
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
