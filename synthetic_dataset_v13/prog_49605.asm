; DESCRIPTION: Renders a white line between points (452, 120) and (463, 98).
; PLAN: r0=452(x1), r1=120(y1), r2=463(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 120
LDI r2, 463
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
