; DESCRIPTION: Places a green line segment connecting (66, 240) to (344, 211).
; PLAN: r0=66(x1), r1=240(y1), r2=344(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 240
LDI r2, 344
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
