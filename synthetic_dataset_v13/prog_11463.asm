; DESCRIPTION: Places a blue line segment connecting (172, 165) to (510, 203).
; PLAN: r0=172(x1), r1=165(y1), r2=510(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 165
LDI r2, 510
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
