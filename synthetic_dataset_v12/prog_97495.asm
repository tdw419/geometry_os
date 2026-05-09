; DESCRIPTION: Places a blue line segment connecting (325, 129) to (229, 162).
; PLAN: r0=325(x1), r1=129(y1), r2=229(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 129
LDI r2, 229
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
