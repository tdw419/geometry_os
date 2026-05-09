; DESCRIPTION: Places a green line segment connecting (199, 147) to (207, 16).
; PLAN: r0=199(x1), r1=147(y1), r2=207(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 147
LDI r2, 207
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
