; DESCRIPTION: Places a magenta line segment connecting (264, 110) to (108, 130).
; PLAN: r0=264(x1), r1=110(y1), r2=108(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 110
LDI r2, 108
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
