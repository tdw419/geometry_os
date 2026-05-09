; DESCRIPTION: Renders a red line between points (273, 129) and (185, 60).
; PLAN: r0=273(x1), r1=129(y1), r2=185(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 129
LDI r2, 185
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
