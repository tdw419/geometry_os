; DESCRIPTION: Places a green line segment connecting (207, 217) to (487, 147).
; PLAN: r0=207(x1), r1=217(y1), r2=487(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 217
LDI r2, 487
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
