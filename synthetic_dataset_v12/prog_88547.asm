; DESCRIPTION: Places a white line segment connecting (144, 147) to (291, 14).
; PLAN: r0=144(x1), r1=147(y1), r2=291(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 147
LDI r2, 291
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
