; DESCRIPTION: Composite: Draws a blue rectangle at (340, 137) with width 48 and height 45 then Renders a orange disk with center (254, 180) and radius 40.
; PLAN: r0=340(x), r1=137(y), r2=48(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x), r6=180(y), r7=40(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 340
LDI r1, 137
LDI r2, 48
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 180
LDI r7, 40
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
