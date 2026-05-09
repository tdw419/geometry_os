; DESCRIPTION: Composite: Creates a yellow circular shape at (323, 180) with radius 50 then Draws a blue rectangle at (15, 60) with width 19 and height 83.
; PLAN: r0=323(x), r1=180(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=60(y), r7=19(width), r8=83(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 180
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 60
LDI r7, 19
LDI r8, 83
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
