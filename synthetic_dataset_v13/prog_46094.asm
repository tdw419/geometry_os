; DESCRIPTION: Renders a red line between points (226, 175) and (435, 234).
; PLAN: r0=226(x1), r1=175(y1), r2=435(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 175
LDI r2, 435
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
