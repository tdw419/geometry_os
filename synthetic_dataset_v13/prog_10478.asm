; DESCRIPTION: Composite: Draws a black rectangle at (46, 116) with width 25 and height 26 then Creates a white circular shape at (120, 110) with radius 67.
; PLAN: r0=46(x), r1=116(y), r2=25(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=110(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 46
LDI r1, 116
LDI r2, 25
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 110
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
