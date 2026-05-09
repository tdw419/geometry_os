; DESCRIPTION: Composite: Places a white dot at position (245, 245) then Places a black circle of radius 20 at center (88, 53) then Renders a black box of size 10x10 starting at (367, 93).
; PLAN: r0=245(x), r1=245(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=53(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=367(x), r11=93(y), r12=10(width), r13=10(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 245
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 88
LDI r6, 53
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 367
LDI r11, 93
LDI r12, 10
LDI r13, 10
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
