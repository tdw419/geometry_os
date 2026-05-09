; DESCRIPTION: Places a green line segment connecting (402, 48) to (326, 241).
; PLAN: r0=402(x1), r1=48(y1), r2=326(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 48
LDI r2, 326
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
