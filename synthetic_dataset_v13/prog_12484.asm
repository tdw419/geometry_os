; DESCRIPTION: Places a blue line segment connecting (311, 147) to (320, 24).
; PLAN: r0=311(x1), r1=147(y1), r2=320(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 147
LDI r2, 320
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
