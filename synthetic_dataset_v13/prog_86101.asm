; DESCRIPTION: Draws a black line from (341, 60) to (471, 22).
; PLAN: r0=341(x1), r1=60(y1), r2=471(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 60
LDI r2, 471
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
