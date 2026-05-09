; DESCRIPTION: Places a blue line segment connecting (430, 129) to (467, 179).
; PLAN: r0=430(x1), r1=129(y1), r2=467(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 129
LDI r2, 467
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
