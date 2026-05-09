; DESCRIPTION: Composite: Places a cyan circle of radius 37 at center (278, 122) then Draws a green rectangle at (43, 122) with width 23 and height 99.
; PLAN: r0=278(x), r1=122(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=43(x), r6=122(y), r7=23(width), r8=99(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 122
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 43
LDI r6, 122
LDI r7, 23
LDI r8, 99
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
