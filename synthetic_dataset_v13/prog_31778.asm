; DESCRIPTION: Renders a blue line between points (3, 7) and (498, 245).
; PLAN: r0=3(x1), r1=7(y1), r2=498(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 7
LDI r2, 498
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
