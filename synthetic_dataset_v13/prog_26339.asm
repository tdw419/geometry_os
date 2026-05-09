; DESCRIPTION: Places a black line segment connecting (44, 165) to (150, 244).
; PLAN: r0=44(x1), r1=165(y1), r2=150(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 165
LDI r2, 150
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
