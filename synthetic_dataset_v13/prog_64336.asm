; DESCRIPTION: Renders a red line between points (320, 85) and (82, 60).
; PLAN: r0=320(x1), r1=85(y1), r2=82(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 85
LDI r2, 82
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
