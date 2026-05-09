; DESCRIPTION: Places a green line segment connecting (291, 147) to (275, 105).
; PLAN: r0=291(x1), r1=147(y1), r2=275(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 147
LDI r2, 275
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
