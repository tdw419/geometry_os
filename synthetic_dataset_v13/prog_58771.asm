; DESCRIPTION: Places a green line segment connecting (375, 147) to (61, 169).
; PLAN: r0=375(x1), r1=147(y1), r2=61(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 147
LDI r2, 61
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
