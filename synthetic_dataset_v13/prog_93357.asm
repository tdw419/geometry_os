; DESCRIPTION: Places a green line segment connecting (107, 147) to (447, 124).
; PLAN: r0=107(x1), r1=147(y1), r2=447(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 147
LDI r2, 447
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
