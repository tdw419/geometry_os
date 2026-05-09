; DESCRIPTION: Places a blue line segment connecting (91, 251) to (365, 104).
; PLAN: r0=91(x1), r1=251(y1), r2=365(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 251
LDI r2, 365
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
