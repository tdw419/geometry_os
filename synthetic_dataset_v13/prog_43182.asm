; DESCRIPTION: Places a magenta line segment connecting (247, 245) to (328, 123).
; PLAN: r0=247(x1), r1=245(y1), r2=328(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 245
LDI r2, 328
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
