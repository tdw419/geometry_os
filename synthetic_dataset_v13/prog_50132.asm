; DESCRIPTION: Composite: Draws a white rectangle at (336, 48) with width 81 and height 83 then Places a white circle of radius 67 at center (70, 172).
; PLAN: r0=336(x), r1=48(y), r2=81(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=70(x), r6=172(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 336
LDI r1, 48
LDI r2, 81
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 172
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
