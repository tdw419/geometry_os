; DESCRIPTION: Composite: Renders a black box of size 35x88 starting at (225, 82) then Places a orange circle of radius 32 at center (467, 122).
; PLAN: r0=225(x), r1=82(y), r2=35(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x), r6=122(y), r7=32(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 225
LDI r1, 82
LDI r2, 35
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 122
LDI r7, 32
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
