; DESCRIPTION: Places a yellow line segment connecting (402, 230) to (238, 63).
; PLAN: r0=402(x1), r1=230(y1), r2=238(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 230
LDI r2, 238
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
