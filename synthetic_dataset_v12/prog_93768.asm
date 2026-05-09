; DESCRIPTION: Places a magenta line segment connecting (273, 26) to (65, 39).
; PLAN: r0=273(x1), r1=26(y1), r2=65(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 26
LDI r2, 65
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
