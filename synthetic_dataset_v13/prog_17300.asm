; DESCRIPTION: Places a yellow line segment connecting (351, 238) to (443, 191).
; PLAN: r0=351(x1), r1=238(y1), r2=443(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 238
LDI r2, 443
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
