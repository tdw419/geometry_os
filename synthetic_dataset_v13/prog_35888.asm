; DESCRIPTION: Composite: Creates a yellow circular shape at (365, 79) with radius 29 then Draws a red rectangle at (175, 101) with width 110 and height 33.
; PLAN: r0=365(x), r1=79(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=175(x), r6=101(y), r7=110(width), r8=33(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 79
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 175
LDI r6, 101
LDI r7, 110
LDI r8, 33
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
