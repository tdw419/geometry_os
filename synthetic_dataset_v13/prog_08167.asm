; DESCRIPTION: Renders a yellow line between points (184, 30) and (65, 109).
; PLAN: r0=184(x1), r1=30(y1), r2=65(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 30
LDI r2, 65
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
