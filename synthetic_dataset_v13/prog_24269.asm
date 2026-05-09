; DESCRIPTION: Places a white line segment connecting (131, 165) to (443, 86).
; PLAN: r0=131(x1), r1=165(y1), r2=443(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 165
LDI r2, 443
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
