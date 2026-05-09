; DESCRIPTION: Composite: Draws a blue rectangle at (212, 138) with width 52 and height 110 then Renders a cyan disk with center (161, 172) and radius 37.
; PLAN: r0=212(x), r1=138(y), r2=52(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=161(x), r6=172(y), r7=37(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 212
LDI r1, 138
LDI r2, 52
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 172
LDI r7, 37
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
