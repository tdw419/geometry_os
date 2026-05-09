; DESCRIPTION: Places a red line segment connecting (55, 142) to (429, 149).
; PLAN: r0=55(x1), r1=142(y1), r2=429(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 142
LDI r2, 429
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
