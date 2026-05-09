; DESCRIPTION: Composite: Creates a white circular shape at (98, 192) with radius 11 then Draws a blue rectangle at (269, 35) with width 54 and height 100.
; PLAN: r0=98(x), r1=192(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x), r6=35(y), r7=54(width), r8=100(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 192
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 35
LDI r7, 54
LDI r8, 100
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
