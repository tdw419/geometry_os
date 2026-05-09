; DESCRIPTION: Composite: Draws a white rectangle at (350, 122) with width 77 and height 15 then Sets a single black pixel at (323, 72) then Creates a red circular shape at (424, 107) with radius 10.
; PLAN: r0=350(x), r1=122(y), r2=77(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x), r6=72(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=424(x), r11=107(y), r12=10(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 350
LDI r1, 122
LDI r2, 77
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 72
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 424
LDI r11, 107
LDI r12, 10
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
