; DESCRIPTION: Composite: Draws a orange rectangle at (464, 130) with width 48 and height 76 then Creates a blue circular shape at (197, 180) with radius 50 then Sets a single cyan pixel at (211, 77).
; PLAN: r0=464(x), r1=130(y), r2=48(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x), r6=180(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=211(x), r11=77(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 464
LDI r1, 130
LDI r2, 48
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 180
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 211
LDI r11, 77
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
