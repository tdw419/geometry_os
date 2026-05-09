; DESCRIPTION: Places a magenta line segment connecting (347, 50) to (492, 56).
; PLAN: r0=347(x1), r1=50(y1), r2=492(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 50
LDI r2, 492
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
