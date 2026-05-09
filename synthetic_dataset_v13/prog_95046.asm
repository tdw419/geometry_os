; DESCRIPTION: Places a magenta line segment connecting (110, 240) to (208, 108).
; PLAN: r0=110(x1), r1=240(y1), r2=208(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 240
LDI r2, 208
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
