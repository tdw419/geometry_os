; DESCRIPTION: Places a white line segment connecting (443, 18) to (352, 159).
; PLAN: r0=443(x1), r1=18(y1), r2=352(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 18
LDI r2, 352
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
