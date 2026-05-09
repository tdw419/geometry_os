; DESCRIPTION: Composite: Draws a magenta rectangle at (332, 179) with width 10 and height 45 then Renders a green disk with center (76, 73) and radius 70.
; PLAN: r0=332(x), r1=179(y), r2=10(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x), r6=73(y), r7=70(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 332
LDI r1, 179
LDI r2, 10
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 73
LDI r7, 70
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
