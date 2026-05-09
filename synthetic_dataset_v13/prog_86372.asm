; DESCRIPTION: Places a blue line segment connecting (8, 129) to (344, 191).
; PLAN: r0=8(x1), r1=129(y1), r2=344(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 129
LDI r2, 344
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
