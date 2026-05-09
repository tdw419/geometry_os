; DESCRIPTION: Places a purple line segment connecting (54, 62) to (375, 95).
; PLAN: r0=54(x1), r1=62(y1), r2=375(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 62
LDI r2, 375
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
