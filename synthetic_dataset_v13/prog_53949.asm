; DESCRIPTION: Composite: Places a blue circle of radius 12 at center (217, 161) then Draws a orange rectangle at (334, 10) with width 78 and height 28.
; PLAN: r0=217(x), r1=161(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x), r6=10(y), r7=78(width), r8=28(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 161
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 10
LDI r7, 78
LDI r8, 28
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
