; DESCRIPTION: Composite: Draws a black rectangle at (133, 60) with width 81 and height 26 then Renders a orange disk with center (236, 76) and radius 13.
; PLAN: r0=133(x), r1=60(y), r2=81(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x), r6=76(y), r7=13(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 60
LDI r2, 81
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 76
LDI r7, 13
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
