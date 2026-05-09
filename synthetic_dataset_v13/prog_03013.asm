; DESCRIPTION: Renders a purple line between points (436, 209) and (495, 184).
; PLAN: r0=436(x1), r1=209(y1), r2=495(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 209
LDI r2, 495
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
