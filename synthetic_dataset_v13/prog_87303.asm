; DESCRIPTION: Places a green line segment connecting (250, 136) to (352, 178).
; PLAN: r0=250(x1), r1=136(y1), r2=352(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 136
LDI r2, 352
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
