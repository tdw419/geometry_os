; DESCRIPTION: Composite: Draws a orange rectangle at (204, 157) with width 27 and height 70 then Renders a cyan disk with center (210, 78) and radius 71 then Places a yellow dot at position (180, 241).
; PLAN: r0=204(x), r1=157(y), r2=27(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=78(y), r7=71(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=180(x), r11=241(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 204
LDI r1, 157
LDI r2, 27
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 78
LDI r7, 71
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 180
LDI r11, 241
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
