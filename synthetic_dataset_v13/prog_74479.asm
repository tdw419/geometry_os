; DESCRIPTION: Places a magenta line segment connecting (152, 105) to (401, 147).
; PLAN: r0=152(x1), r1=105(y1), r2=401(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 105
LDI r2, 401
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
