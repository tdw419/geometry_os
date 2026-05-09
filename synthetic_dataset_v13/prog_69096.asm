; DESCRIPTION: Renders a green line between points (12, 161) and (85, 247).
; PLAN: r0=12(x1), r1=161(y1), r2=85(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 161
LDI r2, 85
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
