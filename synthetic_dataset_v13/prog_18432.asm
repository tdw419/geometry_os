; DESCRIPTION: Places a blue line segment connecting (199, 154) to (117, 85).
; PLAN: r0=199(x1), r1=154(y1), r2=117(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 154
LDI r2, 117
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
