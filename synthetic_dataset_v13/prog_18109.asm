; DESCRIPTION: Composite: Draws a blue circle centered at (191, 33) with radius 25 then Draws a white rectangle at (191, 48) with width 29 and height 81.
; PLAN: r0=191(x), r1=33(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x), r6=48(y), r7=29(width), r8=81(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 33
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 48
LDI r7, 29
LDI r8, 81
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
