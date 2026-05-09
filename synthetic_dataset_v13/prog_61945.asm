; DESCRIPTION: Composite: Creates a blue rectangular region at (105, 130) spanning 31 by 77 pixels then Places a purple circle of radius 53 at center (389, 173) then Sets a single black pixel at (210, 142).
; PLAN: r0=105(x), r1=130(y), r2=31(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=389(x), r6=173(y), r7=53(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=210(x), r11=142(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 130
LDI r2, 31
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 173
LDI r7, 53
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 210
LDI r11, 142
LDI r12, 0x000000
PSET r10, r11, r12
HALT
