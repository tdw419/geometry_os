; DESCRIPTION: Composite: Creates a white circular shape at (76, 92) with radius 70 then Draws a yellow rectangle at (385, 98) with width 117 and height 100.
; PLAN: r0=76(x), r1=92(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=98(y), r7=117(width), r8=100(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 92
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 98
LDI r7, 117
LDI r8, 100
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
