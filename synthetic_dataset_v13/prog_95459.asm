; DESCRIPTION: Places a orange line segment connecting (135, 130) to (136, 26).
; PLAN: r0=135(x1), r1=130(y1), r2=136(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 130
LDI r2, 136
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
