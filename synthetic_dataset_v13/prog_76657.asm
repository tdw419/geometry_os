; DESCRIPTION: Renders a white line between points (467, 132) and (170, 81).
; PLAN: r0=467(x1), r1=132(y1), r2=170(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 132
LDI r2, 170
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
