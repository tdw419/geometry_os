; DESCRIPTION: Places a green line segment connecting (335, 147) to (215, 155).
; PLAN: r0=335(x1), r1=147(y1), r2=215(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 147
LDI r2, 215
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
