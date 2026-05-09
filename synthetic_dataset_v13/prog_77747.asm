; DESCRIPTION: Renders a white line between points (197, 158) and (452, 49).
; PLAN: r0=197(x1), r1=158(y1), r2=452(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 158
LDI r2, 452
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
