; DESCRIPTION: Places a white line segment connecting (430, 147) to (61, 143).
; PLAN: r0=430(x1), r1=147(y1), r2=61(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 147
LDI r2, 61
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
