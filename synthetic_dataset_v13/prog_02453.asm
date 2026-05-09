; DESCRIPTION: Places a blue line segment connecting (203, 126) to (414, 149).
; PLAN: r0=203(x1), r1=126(y1), r2=414(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 126
LDI r2, 414
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
