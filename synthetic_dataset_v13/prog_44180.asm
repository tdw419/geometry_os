; DESCRIPTION: Renders a red line between points (282, 85) and (402, 121).
; PLAN: r0=282(x1), r1=85(y1), r2=402(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 85
LDI r2, 402
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
