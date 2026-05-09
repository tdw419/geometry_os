; DESCRIPTION: Places a green line segment connecting (331, 50) to (254, 232).
; PLAN: r0=331(x1), r1=50(y1), r2=254(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 50
LDI r2, 254
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
