; DESCRIPTION: Composite: Sets a single orange pixel at (291, 255) then Renders a purple disk with center (88, 134) and radius 39 then Creates a blue rectangular region at (39, 206) spanning 39 by 25 pixels.
; PLAN: r0=291(x), r1=255(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=134(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=39(x), r11=206(y), r12=39(width), r13=25(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 255
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 88
LDI r6, 134
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 39
LDI r11, 206
LDI r12, 39
LDI r13, 25
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
