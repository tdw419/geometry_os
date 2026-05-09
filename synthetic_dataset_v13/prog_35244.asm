; DESCRIPTION: Places a purple line segment connecting (239, 69) to (7, 179).
; PLAN: r0=239(x1), r1=69(y1), r2=7(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 69
LDI r2, 7
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
