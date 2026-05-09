; DESCRIPTION: Places a white line segment connecting (114, 192) to (79, 159).
; PLAN: r0=114(x1), r1=192(y1), r2=79(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 192
LDI r2, 79
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
