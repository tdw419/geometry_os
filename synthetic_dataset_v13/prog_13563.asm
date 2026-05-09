; DESCRIPTION: Composite: Creates a black rectangular region at (391, 116) spanning 106 by 66 pixels then Renders a purple line between points (170, 155) and (151, 20).
; PLAN: r0=391(x), r1=116(y), r2=106(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x1), r6=155(y1), r7=151(x2), r8=20(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 116
LDI r2, 106
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 155
LDI r7, 151
LDI r8, 20
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
