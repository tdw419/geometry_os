; DESCRIPTION: Renders a purple line between points (399, 4) and (219, 33).
; PLAN: r0=399(x1), r1=4(y1), r2=219(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 4
LDI r2, 219
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
