; DESCRIPTION: Places a white line segment connecting (443, 107) to (219, 84).
; PLAN: r0=443(x1), r1=107(y1), r2=219(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 107
LDI r2, 219
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
