; DESCRIPTION: Places a magenta line segment connecting (321, 110) to (222, 45).
; PLAN: r0=321(x1), r1=110(y1), r2=222(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 110
LDI r2, 222
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
