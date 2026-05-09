; DESCRIPTION: Composite: Places a magenta dot at position (408, 42) then Places a yellow circle of radius 75 at center (310, 92) then Renders a black box of size 45x96 starting at (140, 45).
; PLAN: r0=408(x), r1=42(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=92(y), r7=75(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=140(x), r11=45(y), r12=45(width), r13=96(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 42
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 310
LDI r6, 92
LDI r7, 75
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 140
LDI r11, 45
LDI r12, 45
LDI r13, 96
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
