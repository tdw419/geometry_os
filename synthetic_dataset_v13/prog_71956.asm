; DESCRIPTION: Renders a yellow line between points (168, 70) and (292, 100).
; PLAN: r0=168(x1), r1=70(y1), r2=292(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 70
LDI r2, 292
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
