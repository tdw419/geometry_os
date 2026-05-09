; DESCRIPTION: Places a blue line segment connecting (311, 36) to (253, 249).
; PLAN: r0=311(x1), r1=36(y1), r2=253(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 36
LDI r2, 253
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
