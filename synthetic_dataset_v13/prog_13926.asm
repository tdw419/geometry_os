; DESCRIPTION: Composite: Renders a white box of size 107x20 starting at (149, 230) then Places a blue circle of radius 47 at center (442, 101).
; PLAN: r0=149(x), r1=230(y), r2=107(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=101(y), r7=47(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 149
LDI r1, 230
LDI r2, 107
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 101
LDI r7, 47
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
