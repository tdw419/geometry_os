; DESCRIPTION: Composite: Creates a blue circular shape at (230, 106) with radius 67 then Draws a red rectangle at (25, 112) with width 26 and height 76.
; PLAN: r0=230(x), r1=106(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x), r6=112(y), r7=26(width), r8=76(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 230
LDI r1, 106
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 112
LDI r7, 26
LDI r8, 76
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
