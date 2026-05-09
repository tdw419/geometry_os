; DESCRIPTION: Composite: Renders a green line between points (426, 99) and (77, 163) then Creates a purple rectangular region at (25, 30) spanning 105 by 114 pixels then Places a blue circle of radius 39 at center (360, 154).
; PLAN: r0=426(x1), r1=99(y1), r2=77(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=30(y), r7=105(width), r8=114(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=360(x), r11=154(y), r12=39(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 426
LDI r1, 99
LDI r2, 77
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 30
LDI r7, 105
LDI r8, 114
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 154
LDI r12, 39
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
