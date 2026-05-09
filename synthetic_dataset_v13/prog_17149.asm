; DESCRIPTION: Composite: Renders a black box of size 105x38 starting at (377, 54) then Draws a black circle centered at (107, 128) with radius 80.
; PLAN: r0=377(x), r1=54(y), r2=105(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x), r6=128(y), r7=80(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 377
LDI r1, 54
LDI r2, 105
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 128
LDI r7, 80
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
