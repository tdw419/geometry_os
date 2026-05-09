; DESCRIPTION: Composite: Places a green circle of radius 64 at center (306, 75) then Draws a red rectangle at (244, 32) with width 85 and height 119 then Places a red dot at position (159, 218).
; PLAN: r0=306(x), r1=75(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=244(x), r6=32(y), r7=85(width), r8=119(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=159(x), r11=218(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 306
LDI r1, 75
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 244
LDI r6, 32
LDI r7, 85
LDI r8, 119
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 218
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
