; DESCRIPTION: Places a green line segment connecting (480, 83) to (402, 201).
; PLAN: r0=480(x1), r1=83(y1), r2=402(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 83
LDI r2, 402
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
