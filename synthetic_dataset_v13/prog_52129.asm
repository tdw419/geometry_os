; DESCRIPTION: Composite: Creates a white rectangular region at (50, 137) spanning 69 by 53 pixels then Places a purple dot at position (455, 90) then Renders a magenta disk with center (128, 121) and radius 71.
; PLAN: r0=50(x), r1=137(y), r2=69(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x), r6=90(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=128(x), r11=121(y), r12=71(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 50
LDI r1, 137
LDI r2, 69
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 90
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 128
LDI r11, 121
LDI r12, 71
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
