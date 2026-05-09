; DESCRIPTION: Places a blue line segment connecting (247, 185) to (152, 234).
; PLAN: r0=247(x1), r1=185(y1), r2=152(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 185
LDI r2, 152
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
