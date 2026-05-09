; DESCRIPTION: Places a magenta line segment connecting (432, 236) to (152, 13).
; PLAN: r0=432(x1), r1=236(y1), r2=152(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 236
LDI r2, 152
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
