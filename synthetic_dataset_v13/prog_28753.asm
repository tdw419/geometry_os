; DESCRIPTION: Composite: Places a purple circle of radius 49 at center (78, 148) then Sets a single orange pixel at (386, 38) then Renders a black box of size 114x12 starting at (174, 174).
; PLAN: r0=78(x), r1=148(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=386(x), r6=38(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=174(x), r11=174(y), r12=114(width), r13=12(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 148
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 386
LDI r6, 38
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 174
LDI r11, 174
LDI r12, 114
LDI r13, 12
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
