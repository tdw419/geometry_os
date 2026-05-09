; DESCRIPTION: Places a blue line segment connecting (152, 205) to (112, 35).
; PLAN: r0=152(x1), r1=205(y1), r2=112(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 205
LDI r2, 112
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
