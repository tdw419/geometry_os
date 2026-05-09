; DESCRIPTION: Places a magenta line segment connecting (287, 244) to (459, 64).
; PLAN: r0=287(x1), r1=244(y1), r2=459(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 244
LDI r2, 459
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
