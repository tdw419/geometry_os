; DESCRIPTION: Composite: Creates a orange circular shape at (205, 105) with radius 77 then Draws a green rectangle at (255, 82) with width 120 and height 28.
; PLAN: r0=205(x), r1=105(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=255(x), r6=82(y), r7=120(width), r8=28(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 105
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 255
LDI r6, 82
LDI r7, 120
LDI r8, 28
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
