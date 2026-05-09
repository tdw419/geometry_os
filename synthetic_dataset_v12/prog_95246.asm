; DESCRIPTION: Composite: Sets a single orange pixel at (407, 42) then Renders a yellow box of size 36x69 starting at (101, 10) then Creates a magenta circular shape at (402, 239) with radius 15.
; PLAN: r0=407(x), r1=42(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=101(x), r6=10(y), r7=36(width), r8=69(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=402(x), r11=239(y), r12=15(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 407
LDI r1, 42
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 101
LDI r6, 10
LDI r7, 36
LDI r8, 69
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 239
LDI r12, 15
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
