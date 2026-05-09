; DESCRIPTION: Composite: Places a green circle of radius 78 at center (114, 130) then Draws a orange rectangle at (45, 183) with width 33 and height 72.
; PLAN: r0=114(x), r1=130(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x), r6=183(y), r7=33(width), r8=72(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 130
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 183
LDI r7, 33
LDI r8, 72
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
