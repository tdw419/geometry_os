; DESCRIPTION: Composite: Draws a purple rectangle at (63, 130) with width 62 and height 119 then Places a orange circle of radius 35 at center (243, 46).
; PLAN: r0=63(x), r1=130(y), r2=62(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x), r6=46(y), r7=35(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 63
LDI r1, 130
LDI r2, 62
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 46
LDI r7, 35
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
