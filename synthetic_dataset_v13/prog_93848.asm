; DESCRIPTION: Composite: Creates a blue circular shape at (258, 62) with radius 40 then Draws a red rectangle at (102, 134) with width 32 and height 20.
; PLAN: r0=258(x), r1=62(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x), r6=134(y), r7=32(width), r8=20(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 62
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 134
LDI r7, 32
LDI r8, 20
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
