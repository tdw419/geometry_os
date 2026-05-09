; DESCRIPTION: Composite: Draws a green rectangle at (54, 93) with width 52 and height 108 then Places a orange dot at position (296, 40).
; PLAN: r0=54(x), r1=93(y), r2=52(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=296(x), r6=40(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 54
LDI r1, 93
LDI r2, 52
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 40
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
