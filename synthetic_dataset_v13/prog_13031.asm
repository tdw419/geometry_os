; DESCRIPTION: Places a magenta line segment connecting (55, 136) to (347, 50).
; PLAN: r0=55(x1), r1=136(y1), r2=347(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 136
LDI r2, 347
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
