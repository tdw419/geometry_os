; DESCRIPTION: Composite: Renders a purple line between points (116, 106) and (226, 193) then Creates a green rectangular region at (273, 142) spanning 119 by 101 pixels.
; PLAN: r0=116(x1), r1=106(y1), r2=226(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=273(x), r6=142(y), r7=119(width), r8=101(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 106
LDI r2, 226
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 142
LDI r7, 119
LDI r8, 101
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
