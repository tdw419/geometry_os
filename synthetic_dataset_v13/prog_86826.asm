; DESCRIPTION: Places a blue line segment connecting (16, 165) to (336, 229).
; PLAN: r0=16(x1), r1=165(y1), r2=336(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 165
LDI r2, 336
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
