; DESCRIPTION: Renders a green line between points (42, 173) and (462, 35).
; PLAN: r0=42(x1), r1=173(y1), r2=462(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 173
LDI r2, 462
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
