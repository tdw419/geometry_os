; DESCRIPTION: Composite: Renders a green disk with center (144, 228) and radius 13 then Places a white dot at position (207, 100) then Creates a green rectangular region at (472, 162) spanning 11 by 34 pixels.
; PLAN: r0=144(x), r1=228(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x), r6=100(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=472(x), r11=162(y), r12=11(width), r13=34(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 228
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 100
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 472
LDI r11, 162
LDI r12, 11
LDI r13, 34
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
