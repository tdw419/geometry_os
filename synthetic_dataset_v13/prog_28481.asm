; DESCRIPTION: Places a magenta line segment connecting (372, 203) to (288, 179).
; PLAN: r0=372(x1), r1=203(y1), r2=288(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 203
LDI r2, 288
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
