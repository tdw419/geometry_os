; DESCRIPTION: Composite: Renders a magenta box of size 33x49 starting at (148, 62) then Places a yellow circle of radius 45 at center (69, 115) then Places a purple dot at position (58, 30).
; PLAN: r0=148(x), r1=62(y), r2=33(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x), r6=115(y), r7=45(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=58(x), r11=30(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 148
LDI r1, 62
LDI r2, 33
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 115
LDI r7, 45
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 58
LDI r11, 30
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
