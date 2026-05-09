; DESCRIPTION: Places a orange line segment connecting (443, 48) to (82, 159).
; PLAN: r0=443(x1), r1=48(y1), r2=82(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 48
LDI r2, 82
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
