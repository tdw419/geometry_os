; DESCRIPTION: Composite: Renders a orange disk with center (341, 106) and radius 15 then Renders a magenta line between points (473, 254) and (225, 26) then Creates a white rectangular region at (302, 151) spanning 52 by 78 pixels.
; PLAN: r0=341(x), r1=106(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=473(x1), r6=254(y1), r7=225(x2), r8=26(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=302(x), r11=151(y), r12=52(width), r13=78(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 106
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 473
LDI r6, 254
LDI r7, 225
LDI r8, 26
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 151
LDI r12, 52
LDI r13, 78
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
