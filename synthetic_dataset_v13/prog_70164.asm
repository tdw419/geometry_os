; DESCRIPTION: Places a magenta line segment connecting (377, 3) to (495, 239).
; PLAN: r0=377(x1), r1=3(y1), r2=495(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 3
LDI r2, 495
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
