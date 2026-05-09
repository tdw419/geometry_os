; DESCRIPTION: Composite: Draws a magenta circle centered at (271, 136) with radius 56 then Renders a black box of size 60x46 starting at (320, 158).
; PLAN: r0=271(x), r1=136(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x), r6=158(y), r7=60(width), r8=46(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 136
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 158
LDI r7, 60
LDI r8, 46
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
