; DESCRIPTION: Composite: Draws a orange rectangle at (79, 9) with width 28 and height 105 then Renders a yellow disk with center (87, 89) and radius 12.
; PLAN: r0=79(x), r1=9(y), r2=28(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x), r6=89(y), r7=12(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 79
LDI r1, 9
LDI r2, 28
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 89
LDI r7, 12
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
