; DESCRIPTION: Composite: Places a orange 60x20 rectangle at position (41, 81) then Draws a yellow circle centered at (350, 174) with radius 43.
; PLAN: r0=41(x), r1=81(y), r2=60(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x), r6=174(y), r7=43(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 41
LDI r1, 81
LDI r2, 60
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 174
LDI r7, 43
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
