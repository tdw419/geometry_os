; DESCRIPTION: Composite: Renders a green line between points (128, 175) and (112, 131) then Creates a black rectangular region at (133, 161) spanning 93 by 66 pixels.
; PLAN: r0=128(x1), r1=175(y1), r2=112(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=161(y), r7=93(width), r8=66(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 175
LDI r2, 112
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 161
LDI r7, 93
LDI r8, 66
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
