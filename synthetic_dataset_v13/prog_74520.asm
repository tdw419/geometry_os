; DESCRIPTION: Composite: Places a green circle of radius 54 at center (278, 132) then Draws a orange rectangle at (286, 113) with width 62 and height 108 then Places a red dot at position (203, 16).
; PLAN: r0=278(x), r1=132(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x), r6=113(y), r7=62(width), r8=108(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=203(x), r11=16(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 278
LDI r1, 132
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 113
LDI r7, 62
LDI r8, 108
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 16
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
