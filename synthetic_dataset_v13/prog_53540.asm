; DESCRIPTION: Composite: Sets a single white pixel at (149, 146) then Renders a white disk with center (182, 78) and radius 62 then Creates a blue rectangular region at (264, 8) spanning 116 by 31 pixels.
; PLAN: r0=149(x), r1=146(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=78(y), r7=62(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=264(x), r11=8(y), r12=116(width), r13=31(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 149
LDI r1, 146
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 182
LDI r6, 78
LDI r7, 62
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 264
LDI r11, 8
LDI r12, 116
LDI r13, 31
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
