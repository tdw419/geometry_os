; DESCRIPTION: Places a green line segment connecting (352, 194) to (250, 211).
; PLAN: r0=352(x1), r1=194(y1), r2=250(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 194
LDI r2, 250
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
