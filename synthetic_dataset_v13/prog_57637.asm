; DESCRIPTION: Composite: Sets a single black pixel at (138, 106) then Renders a yellow disk with center (76, 139) and radius 71 then Renders a black box of size 45x42 starting at (432, 154).
; PLAN: r0=138(x), r1=106(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=76(x), r6=139(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=432(x), r11=154(y), r12=45(width), r13=42(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 106
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 76
LDI r6, 139
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 432
LDI r11, 154
LDI r12, 45
LDI r13, 42
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
