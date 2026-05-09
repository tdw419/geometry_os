; DESCRIPTION: Composite: Renders a white disk with center (253, 104) and radius 66 then Draws a yellow rectangle at (286, 125) with width 94 and height 86.
; PLAN: r0=253(x), r1=104(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x), r6=125(y), r7=94(width), r8=86(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 104
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 125
LDI r7, 94
LDI r8, 86
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
