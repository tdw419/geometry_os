; DESCRIPTION: Composite: Draws a orange circle centered at (160, 145) with radius 75 then Draws a green rectangle at (9, 144) with width 27 and height 16.
; PLAN: r0=160(x), r1=145(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=9(x), r6=144(y), r7=27(width), r8=16(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 145
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 9
LDI r6, 144
LDI r7, 27
LDI r8, 16
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
