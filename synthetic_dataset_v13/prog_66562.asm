; DESCRIPTION: Renders a red line between points (195, 60) and (396, 161).
; PLAN: r0=195(x1), r1=60(y1), r2=396(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 60
LDI r2, 396
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
