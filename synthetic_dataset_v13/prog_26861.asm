; DESCRIPTION: Renders a orange line between points (42, 163) and (189, 60).
; PLAN: r0=42(x1), r1=163(y1), r2=189(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 163
LDI r2, 189
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
