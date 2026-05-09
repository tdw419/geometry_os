; DESCRIPTION: Composite: Renders a orange box of size 19x37 starting at (391, 155) then Creates a purple circular shape at (240, 142) with radius 64.
; PLAN: r0=391(x), r1=155(y), r2=19(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=142(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 391
LDI r1, 155
LDI r2, 19
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 142
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
