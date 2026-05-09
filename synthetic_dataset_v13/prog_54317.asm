; DESCRIPTION: Composite: Sets a single white pixel at (438, 232) then Creates a black circular shape at (77, 101) with radius 60 then Places a red 73x109 rectangle at position (277, 121).
; PLAN: r0=438(x), r1=232(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=77(x), r6=101(y), r7=60(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=277(x), r11=121(y), r12=73(width), r13=109(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 232
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 77
LDI r6, 101
LDI r7, 60
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 277
LDI r11, 121
LDI r12, 73
LDI r13, 109
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
