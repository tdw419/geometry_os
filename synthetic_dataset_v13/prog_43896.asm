; DESCRIPTION: Places a black line segment connecting (87, 94) to (443, 212).
; PLAN: r0=87(x1), r1=94(y1), r2=443(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 94
LDI r2, 443
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
