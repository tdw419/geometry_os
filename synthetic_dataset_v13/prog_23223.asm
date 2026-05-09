; DESCRIPTION: Composite: Draws a blue rectangle at (302, 146) with width 86 and height 71 then Renders a orange disk with center (175, 174) and radius 75 then Places a yellow dot at position (113, 80).
; PLAN: r0=302(x), r1=146(y), r2=86(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x), r6=174(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=113(x), r11=80(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 302
LDI r1, 146
LDI r2, 86
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 174
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 113
LDI r11, 80
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
