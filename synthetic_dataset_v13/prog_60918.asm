; DESCRIPTION: Places a white line segment connecting (361, 147) to (452, 142).
; PLAN: r0=361(x1), r1=147(y1), r2=452(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 147
LDI r2, 452
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
