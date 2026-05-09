; DESCRIPTION: Places a orange line segment connecting (305, 192) to (350, 112).
; PLAN: r0=305(x1), r1=192(y1), r2=350(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 192
LDI r2, 350
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
