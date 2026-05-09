; DESCRIPTION: Composite: Sets a single magenta pixel at (268, 131) then Creates a magenta circular shape at (379, 200) with radius 44 then Draws a yellow rectangle at (78, 81) with width 12 and height 60.
; PLAN: r0=268(x), r1=131(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=379(x), r6=200(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=78(x), r11=81(y), r12=12(width), r13=60(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 131
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 379
LDI r6, 200
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 78
LDI r11, 81
LDI r12, 12
LDI r13, 60
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
