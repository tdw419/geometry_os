; DESCRIPTION: Places a green line segment connecting (251, 58) to (65, 188).
; PLAN: r0=251(x1), r1=58(y1), r2=65(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 58
LDI r2, 65
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
