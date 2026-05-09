; DESCRIPTION: Places a magenta line segment connecting (86, 123) to (123, 44).
; PLAN: r0=86(x1), r1=123(y1), r2=123(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 123
LDI r2, 123
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
