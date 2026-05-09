; DESCRIPTION: Renders a green line between points (217, 123) and (120, 109).
; PLAN: r0=217(x1), r1=123(y1), r2=120(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 123
LDI r2, 120
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
