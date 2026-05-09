; DESCRIPTION: Renders a white line between points (299, 125) and (15, 62).
; PLAN: r0=299(x1), r1=125(y1), r2=15(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 125
LDI r2, 15
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
