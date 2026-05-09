; DESCRIPTION: Renders a red line between points (171, 252) and (120, 30).
; PLAN: r0=171(x1), r1=252(y1), r2=120(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 252
LDI r2, 120
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
