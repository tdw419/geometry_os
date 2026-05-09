; DESCRIPTION: Composite: Draws a orange rectangle at (49, 129) with width 58 and height 66 then Renders a green disk with center (100, 66) and radius 62.
; PLAN: r0=49(x), r1=129(y), r2=58(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=66(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 49
LDI r1, 129
LDI r2, 58
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 66
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
