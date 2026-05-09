; DESCRIPTION: Places a green line segment connecting (175, 146) to (351, 79).
; PLAN: r0=175(x1), r1=146(y1), r2=351(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 146
LDI r2, 351
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
