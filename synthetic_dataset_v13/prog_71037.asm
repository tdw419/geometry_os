; DESCRIPTION: Composite: Sets a single white pixel at (306, 192) then Creates a black rectangular region at (414, 169) spanning 28 by 35 pixels then Places a magenta circle of radius 27 at center (326, 42).
; PLAN: r0=306(x), r1=192(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=414(x), r6=169(y), r7=28(width), r8=35(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=326(x), r11=42(y), r12=27(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 306
LDI r1, 192
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 414
LDI r6, 169
LDI r7, 28
LDI r8, 35
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 42
LDI r12, 27
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
