; DESCRIPTION: Composite: Creates a purple rectangular region at (160, 234) spanning 110 by 17 pixels then Renders a red line between points (353, 107) and (44, 59).
; PLAN: r0=160(x), r1=234(y), r2=110(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x1), r6=107(y1), r7=44(x2), r8=59(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 234
LDI r2, 110
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 107
LDI r7, 44
LDI r8, 59
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
