; DESCRIPTION: Places a magenta line segment connecting (347, 60) to (450, 219).
; PLAN: r0=347(x1), r1=60(y1), r2=450(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 60
LDI r2, 450
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
