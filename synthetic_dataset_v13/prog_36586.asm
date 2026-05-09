; DESCRIPTION: Places a black line segment connecting (32, 147) to (33, 24).
; PLAN: r0=32(x1), r1=147(y1), r2=33(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 147
LDI r2, 33
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
