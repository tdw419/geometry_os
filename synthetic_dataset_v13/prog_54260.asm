; DESCRIPTION: Renders a red line between points (292, 193) and (326, 42).
; PLAN: r0=292(x1), r1=193(y1), r2=326(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 193
LDI r2, 326
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
