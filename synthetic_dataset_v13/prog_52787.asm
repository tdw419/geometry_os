; DESCRIPTION: Renders a red line between points (360, 64) and (120, 156).
; PLAN: r0=360(x1), r1=64(y1), r2=120(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 64
LDI r2, 120
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
