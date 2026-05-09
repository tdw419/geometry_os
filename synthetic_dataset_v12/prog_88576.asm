; DESCRIPTION: Composite: Draws a green rectangle at (377, 52) with width 27 and height 118 then Renders a purple disk with center (241, 87) and radius 54.
; PLAN: r0=377(x), r1=52(y), r2=27(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x), r6=87(y), r7=54(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 377
LDI r1, 52
LDI r2, 27
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 87
LDI r7, 54
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
