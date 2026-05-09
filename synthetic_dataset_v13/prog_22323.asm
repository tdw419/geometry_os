; DESCRIPTION: Composite: Draws a red rectangle at (345, 18) with width 52 and height 22 then Renders a orange disk with center (68, 98) and radius 31.
; PLAN: r0=345(x), r1=18(y), r2=52(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x), r6=98(y), r7=31(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 345
LDI r1, 18
LDI r2, 52
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 98
LDI r7, 31
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
