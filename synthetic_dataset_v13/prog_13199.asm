; DESCRIPTION: Renders a red line between points (246, 7) and (464, 120).
; PLAN: r0=246(x1), r1=7(y1), r2=464(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 7
LDI r2, 464
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
