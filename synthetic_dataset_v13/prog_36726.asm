; DESCRIPTION: Composite: Sets a single black pixel at (222, 201) then Draws a white circle centered at (163, 151) with radius 71 then Places a blue 34x99 rectangle at position (187, 36).
; PLAN: r0=222(x), r1=201(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=163(x), r6=151(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=187(x), r11=36(y), r12=34(width), r13=99(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 201
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 163
LDI r6, 151
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 187
LDI r11, 36
LDI r12, 34
LDI r13, 99
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
