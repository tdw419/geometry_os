; DESCRIPTION: Composite: Sets a single white pixel at (358, 185) then Creates a green circular shape at (210, 121) with radius 62 then Renders a cyan box of size 69x19 starting at (169, 175).
; PLAN: r0=358(x), r1=185(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=121(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=169(x), r11=175(y), r12=69(width), r13=19(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 185
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 210
LDI r6, 121
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 169
LDI r11, 175
LDI r12, 69
LDI r13, 19
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
