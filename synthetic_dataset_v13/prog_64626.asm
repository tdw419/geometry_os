; DESCRIPTION: Places a green line segment connecting (143, 147) to (16, 104).
; PLAN: r0=143(x1), r1=147(y1), r2=16(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 147
LDI r2, 16
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
