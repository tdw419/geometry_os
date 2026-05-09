; DESCRIPTION: Renders a yellow line between points (85, 60) and (20, 0).
; PLAN: r0=85(x1), r1=60(y1), r2=20(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 60
LDI r2, 20
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
