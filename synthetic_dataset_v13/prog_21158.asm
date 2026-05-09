; DESCRIPTION: Composite: Sets a single magenta pixel at (243, 43) then Creates a black circular shape at (345, 202) with radius 10 then Creates a blue rectangular region at (241, 157) spanning 18 by 81 pixels.
; PLAN: r0=243(x), r1=43(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=202(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=241(x), r11=157(y), r12=18(width), r13=81(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 243
LDI r1, 43
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 202
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 241
LDI r11, 157
LDI r12, 18
LDI r13, 81
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
