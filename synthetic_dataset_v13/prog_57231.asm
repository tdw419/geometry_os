; DESCRIPTION: Composite: Renders a purple disk with center (216, 142) and radius 48 then Places a white dot at position (505, 238) then Creates a green rectangular region at (442, 146) spanning 11 by 66 pixels.
; PLAN: r0=216(x), r1=142(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=505(x), r6=238(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=442(x), r11=146(y), r12=11(width), r13=66(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 216
LDI r1, 142
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 505
LDI r6, 238
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 442
LDI r11, 146
LDI r12, 11
LDI r13, 66
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
