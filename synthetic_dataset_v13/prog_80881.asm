; DESCRIPTION: Places a white line segment connecting (368, 147) to (339, 208).
; PLAN: r0=368(x1), r1=147(y1), r2=339(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 147
LDI r2, 339
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
