; DESCRIPTION: Composite: Renders a purple disk with center (274, 127) and radius 18 then Places a purple line segment connecting (150, 247) to (65, 139) then Creates a white rectangular region at (104, 25) spanning 58 by 101 pixels.
; PLAN: r0=274(x), r1=127(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x1), r6=247(y1), r7=65(x2), r8=139(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=104(x), r11=25(y), r12=58(width), r13=101(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 127
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 247
LDI r7, 65
LDI r8, 139
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 25
LDI r12, 58
LDI r13, 101
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
