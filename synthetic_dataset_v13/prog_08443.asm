; DESCRIPTION: Renders a orange line between points (299, 93) and (449, 186).
; PLAN: r0=299(x1), r1=93(y1), r2=449(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 93
LDI r2, 449
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
