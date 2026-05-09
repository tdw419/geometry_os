; DESCRIPTION: Places a yellow line segment connecting (49, 81) to (442, 172).
; PLAN: r0=49(x1), r1=81(y1), r2=442(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 81
LDI r2, 442
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
