; DESCRIPTION: Places a cyan line segment connecting (402, 94) to (155, 101).
; PLAN: r0=402(x1), r1=94(y1), r2=155(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 94
LDI r2, 155
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
