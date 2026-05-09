; DESCRIPTION: Renders a orange line between points (260, 88) and (240, 218).
; PLAN: r0=260(x1), r1=88(y1), r2=240(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 88
LDI r2, 240
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
