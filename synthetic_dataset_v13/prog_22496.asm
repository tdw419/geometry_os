; DESCRIPTION: Renders a red line between points (37, 49) and (503, 42).
; PLAN: r0=37(x1), r1=49(y1), r2=503(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 49
LDI r2, 503
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
