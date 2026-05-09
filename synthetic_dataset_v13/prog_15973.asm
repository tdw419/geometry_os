; DESCRIPTION: Places a black line segment connecting (105, 244) to (443, 191).
; PLAN: r0=105(x1), r1=244(y1), r2=443(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 244
LDI r2, 443
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
