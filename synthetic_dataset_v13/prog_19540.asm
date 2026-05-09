; DESCRIPTION: Places a purple line segment connecting (85, 206) to (154, 191).
; PLAN: r0=85(x1), r1=206(y1), r2=154(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 206
LDI r2, 154
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
