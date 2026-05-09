; DESCRIPTION: Renders a white line between points (85, 89) and (113, 122).
; PLAN: r0=85(x1), r1=89(y1), r2=113(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 89
LDI r2, 113
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
