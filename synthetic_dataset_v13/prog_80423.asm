; DESCRIPTION: Composite: Draws a orange circle centered at (270, 139) with radius 60 then Draws a magenta rectangle at (370, 63) with width 31 and height 98 then Places a magenta dot at position (446, 200).
; PLAN: r0=270(x), r1=139(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=370(x), r6=63(y), r7=31(width), r8=98(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=446(x), r11=200(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 270
LDI r1, 139
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 370
LDI r6, 63
LDI r7, 31
LDI r8, 98
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 200
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
