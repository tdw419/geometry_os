; DESCRIPTION: Renders a purple line between points (29, 18) and (200, 27).
; PLAN: r0=29(x1), r1=18(y1), r2=200(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 18
LDI r2, 200
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
