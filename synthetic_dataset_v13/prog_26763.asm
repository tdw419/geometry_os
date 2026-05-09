; DESCRIPTION: Composite: Places a black circle of radius 68 at center (204, 116) then Sets a single black pixel at (71, 251) then Draws a red rectangle at (292, 100) with width 91 and height 103.
; PLAN: r0=204(x), r1=116(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=251(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=292(x), r11=100(y), r12=91(width), r13=103(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 116
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 251
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 292
LDI r11, 100
LDI r12, 91
LDI r13, 103
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
