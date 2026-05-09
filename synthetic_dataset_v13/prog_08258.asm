; DESCRIPTION: Places a black line segment connecting (360, 147) to (274, 37).
; PLAN: r0=360(x1), r1=147(y1), r2=274(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 147
LDI r2, 274
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
