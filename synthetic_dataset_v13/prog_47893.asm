; DESCRIPTION: Places a orange line segment connecting (465, 130) to (35, 62).
; PLAN: r0=465(x1), r1=130(y1), r2=35(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 130
LDI r2, 35
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
