; DESCRIPTION: Places a black line segment connecting (122, 46) to (207, 159).
; PLAN: r0=122(x1), r1=46(y1), r2=207(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 46
LDI r2, 207
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
