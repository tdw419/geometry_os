; DESCRIPTION: Renders a red line between points (434, 174) and (120, 120).
; PLAN: r0=434(x1), r1=174(y1), r2=120(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 174
LDI r2, 120
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
