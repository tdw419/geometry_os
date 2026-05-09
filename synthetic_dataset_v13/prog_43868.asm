; DESCRIPTION: Composite: Draws a purple rectangle at (303, 20) with width 46 and height 37 then Creates a magenta circular shape at (210, 105) with radius 27.
; PLAN: r0=303(x), r1=20(y), r2=46(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=105(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 303
LDI r1, 20
LDI r2, 46
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 105
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
