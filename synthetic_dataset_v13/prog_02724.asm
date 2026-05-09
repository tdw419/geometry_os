; DESCRIPTION: Places a magenta line segment connecting (22, 91) to (144, 255).
; PLAN: r0=22(x1), r1=91(y1), r2=144(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 91
LDI r2, 144
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
