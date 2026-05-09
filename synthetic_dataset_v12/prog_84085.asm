; DESCRIPTION: Draws a black line from (57, 94) to (246, 138).
; PLAN: r0=57(x1), r1=94(y1), r2=246(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 94
LDI r2, 246
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
