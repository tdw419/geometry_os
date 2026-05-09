; DESCRIPTION: Composite: Renders a cyan box of size 95x20 starting at (120, 235) then Creates a yellow circular shape at (490, 203) with radius 12 then Places a magenta dot at position (196, 53).
; PLAN: r0=120(x), r1=235(y), r2=95(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=203(y), r7=12(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=196(x), r11=53(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 120
LDI r1, 235
LDI r2, 95
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 203
LDI r7, 12
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 196
LDI r11, 53
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
