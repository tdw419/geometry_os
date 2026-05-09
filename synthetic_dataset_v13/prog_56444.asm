; DESCRIPTION: Places a green line segment connecting (402, 152) to (467, 9).
; PLAN: r0=402(x1), r1=152(y1), r2=467(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 152
LDI r2, 467
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
