; DESCRIPTION: Renders a red line between points (491, 42) and (461, 161).
; PLAN: r0=491(x1), r1=42(y1), r2=461(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 42
LDI r2, 461
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
