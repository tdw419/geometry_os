; DESCRIPTION: Composite: Draws a black rectangle at (220, 180) with width 96 and height 37 then Renders a white disk with center (368, 86) and radius 45.
; PLAN: r0=220(x), r1=180(y), r2=96(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=86(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 220
LDI r1, 180
LDI r2, 96
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 86
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
