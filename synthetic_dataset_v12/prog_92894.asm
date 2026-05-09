; DESCRIPTION: Places a magenta line segment connecting (152, 92) to (325, 138).
; PLAN: r0=152(x1), r1=92(y1), r2=325(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 92
LDI r2, 325
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
