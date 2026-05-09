; DESCRIPTION: Renders a red line between points (407, 192) and (256, 93).
; PLAN: r0=407(x1), r1=192(y1), r2=256(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 192
LDI r2, 256
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
