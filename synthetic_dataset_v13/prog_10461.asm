; DESCRIPTION: Renders a red line between points (134, 103) and (81, 21).
; PLAN: r0=134(x1), r1=103(y1), r2=81(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 103
LDI r2, 81
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
