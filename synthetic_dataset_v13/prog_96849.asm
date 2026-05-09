; DESCRIPTION: Places a green line segment connecting (351, 250) to (464, 88).
; PLAN: r0=351(x1), r1=250(y1), r2=464(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 250
LDI r2, 464
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
