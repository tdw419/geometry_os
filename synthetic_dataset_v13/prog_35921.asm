; DESCRIPTION: Composite: Places a black dot at position (379, 147) then Renders a red box of size 43x25 starting at (4, 17) then Creates a black circular shape at (423, 126) with radius 65.
; PLAN: r0=379(x), r1=147(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=4(x), r6=17(y), r7=43(width), r8=25(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=423(x), r11=126(y), r12=65(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 379
LDI r1, 147
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 4
LDI r6, 17
LDI r7, 43
LDI r8, 25
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 423
LDI r11, 126
LDI r12, 65
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
