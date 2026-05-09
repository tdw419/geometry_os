; DESCRIPTION: Places a green line segment connecting (32, 252) to (248, 24).
; PLAN: r0=32(x1), r1=252(y1), r2=248(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 252
LDI r2, 248
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
