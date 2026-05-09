; DESCRIPTION: Renders a purple line between points (84, 180) and (347, 154).
; PLAN: r0=84(x1), r1=180(y1), r2=347(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 180
LDI r2, 347
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
