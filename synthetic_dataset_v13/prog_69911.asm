; DESCRIPTION: Places a blue line segment connecting (152, 104) to (256, 104).
; PLAN: r0=152(x1), r1=104(y1), r2=256(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 104
LDI r2, 256
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
