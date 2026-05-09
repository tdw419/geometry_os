; DESCRIPTION: Composite: Places a white circle of radius 65 at center (364, 154) then Places a white dot at position (210, 250) then Creates a white rectangular region at (246, 2) spanning 103 by 74 pixels.
; PLAN: r0=364(x), r1=154(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x), r6=250(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=246(x), r11=2(y), r12=103(width), r13=74(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 154
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 250
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 246
LDI r11, 2
LDI r12, 103
LDI r13, 74
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
