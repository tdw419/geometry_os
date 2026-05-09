; DESCRIPTION: Renders a red line between points (375, 47) and (282, 30).
; PLAN: r0=375(x1), r1=47(y1), r2=282(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 47
LDI r2, 282
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
