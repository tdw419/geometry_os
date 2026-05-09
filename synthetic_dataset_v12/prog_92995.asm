; DESCRIPTION: Renders a white line between points (409, 247) and (93, 252).
; PLAN: r0=409(x1), r1=247(y1), r2=93(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 247
LDI r2, 93
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
