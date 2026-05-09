; DESCRIPTION: Places a magenta line segment connecting (17, 208) to (123, 58).
; PLAN: r0=17(x1), r1=208(y1), r2=123(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 208
LDI r2, 123
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
