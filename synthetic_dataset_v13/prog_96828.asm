; DESCRIPTION: Places a blue line segment connecting (308, 117) to (253, 72).
; PLAN: r0=308(x1), r1=117(y1), r2=253(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 117
LDI r2, 253
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
