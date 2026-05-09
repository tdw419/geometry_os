; DESCRIPTION: Draws a black line from (279, 233) to (109, 183).
; PLAN: r0=279(x1), r1=233(y1), r2=109(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 233
LDI r2, 109
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
