; DESCRIPTION: Renders a white line between points (429, 252) and (483, 121).
; PLAN: r0=429(x1), r1=252(y1), r2=483(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 252
LDI r2, 483
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
