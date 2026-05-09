; DESCRIPTION: Places a blue line segment connecting (402, 47) to (424, 178).
; PLAN: r0=402(x1), r1=47(y1), r2=424(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 47
LDI r2, 424
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
