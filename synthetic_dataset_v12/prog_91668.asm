; DESCRIPTION: Renders a orange line between points (396, 42) and (329, 158).
; PLAN: r0=396(x1), r1=42(y1), r2=329(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 42
LDI r2, 329
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
