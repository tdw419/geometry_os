; DESCRIPTION: Composite: Places a black 85x99 rectangle at position (246, 130) then Draws a magenta circle centered at (231, 41) with radius 35.
; PLAN: r0=246(x), r1=130(y), r2=85(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=41(y), r7=35(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 246
LDI r1, 130
LDI r2, 85
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 41
LDI r7, 35
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
