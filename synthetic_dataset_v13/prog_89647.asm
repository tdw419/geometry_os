; DESCRIPTION: Composite: Renders a cyan disk with center (185, 141) and radius 71 then Draws a green rectangle at (270, 200) with width 49 and height 14 then Places a magenta dot at position (108, 246).
; PLAN: r0=185(x), r1=141(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x), r6=200(y), r7=49(width), r8=14(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=108(x), r11=246(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 185
LDI r1, 141
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 200
LDI r7, 49
LDI r8, 14
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 246
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
