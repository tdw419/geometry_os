; DESCRIPTION: Places a white line segment connecting (453, 46) to (272, 251).
; PLAN: r0=453(x1), r1=46(y1), r2=272(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 46
LDI r2, 272
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
