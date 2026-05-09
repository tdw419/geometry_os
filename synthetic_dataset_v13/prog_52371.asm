; DESCRIPTION: Composite: Draws a red rectangle at (352, 15) with width 104 and height 100 then Creates a yellow circular shape at (353, 85) with radius 27.
; PLAN: r0=352(x), r1=15(y), r2=104(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x), r6=85(y), r7=27(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 352
LDI r1, 15
LDI r2, 104
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 85
LDI r7, 27
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
