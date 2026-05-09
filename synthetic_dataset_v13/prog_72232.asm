; DESCRIPTION: Composite: Creates a black rectangular region at (258, 173) spanning 30 by 69 pixels then Places a black dot at position (226, 65) then Renders a cyan disk with center (449, 224) and radius 17.
; PLAN: r0=258(x), r1=173(y), r2=30(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=65(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=449(x), r11=224(y), r12=17(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 258
LDI r1, 173
LDI r2, 30
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 65
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 449
LDI r11, 224
LDI r12, 17
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
