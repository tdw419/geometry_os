; DESCRIPTION: Places a blue line segment connecting (510, 249) to (10, 104).
; PLAN: r0=510(x1), r1=249(y1), r2=10(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 249
LDI r2, 10
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
