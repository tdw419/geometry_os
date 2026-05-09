; DESCRIPTION: Renders a white line between points (290, 85) and (62, 12).
; PLAN: r0=290(x1), r1=85(y1), r2=62(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 85
LDI r2, 62
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
