; DESCRIPTION: Places a magenta line segment connecting (80, 222) to (244, 150).
; PLAN: r0=80(x1), r1=222(y1), r2=244(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 222
LDI r2, 244
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
