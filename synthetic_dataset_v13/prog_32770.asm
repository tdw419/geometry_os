; DESCRIPTION: Renders a white line between points (184, 60) and (181, 104).
; PLAN: r0=184(x1), r1=60(y1), r2=181(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 60
LDI r2, 181
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
