; DESCRIPTION: Composite: Draws a orange rectangle at (41, 84) with width 120 and height 27 then Renders a yellow disk with center (85, 134) and radius 65.
; PLAN: r0=41(x), r1=84(y), r2=120(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=134(y), r7=65(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 41
LDI r1, 84
LDI r2, 120
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 134
LDI r7, 65
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
