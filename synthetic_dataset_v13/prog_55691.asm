; DESCRIPTION: Places a magenta line segment connecting (377, 192) to (188, 222).
; PLAN: r0=377(x1), r1=192(y1), r2=188(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 192
LDI r2, 188
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
