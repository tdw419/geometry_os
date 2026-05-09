; DESCRIPTION: Renders a red line between points (154, 175) and (435, 159).
; PLAN: r0=154(x1), r1=175(y1), r2=435(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 175
LDI r2, 435
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
