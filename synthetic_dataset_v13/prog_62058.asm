; DESCRIPTION: Composite: Renders a blue box of size 22x51 starting at (257, 84) then Draws a orange circle centered at (207, 187) with radius 37.
; PLAN: r0=257(x), r1=84(y), r2=22(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x), r6=187(y), r7=37(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 257
LDI r1, 84
LDI r2, 22
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 187
LDI r7, 37
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
