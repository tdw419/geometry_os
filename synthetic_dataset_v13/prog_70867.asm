; DESCRIPTION: Places a magenta line segment connecting (138, 129) to (101, 137).
; PLAN: r0=138(x1), r1=129(y1), r2=101(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 129
LDI r2, 101
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
