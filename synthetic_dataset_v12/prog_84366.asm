; DESCRIPTION: Renders a purple line between points (275, 95) and (424, 3).
; PLAN: r0=275(x1), r1=95(y1), r2=424(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 95
LDI r2, 424
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
