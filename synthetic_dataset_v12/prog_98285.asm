; DESCRIPTION: Places a white line segment connecting (131, 147) to (289, 51).
; PLAN: r0=131(x1), r1=147(y1), r2=289(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 147
LDI r2, 289
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
