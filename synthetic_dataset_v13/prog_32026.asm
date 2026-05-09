; DESCRIPTION: Places a purple line segment connecting (65, 55) to (88, 38).
; PLAN: r0=65(x1), r1=55(y1), r2=88(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 55
LDI r2, 88
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
