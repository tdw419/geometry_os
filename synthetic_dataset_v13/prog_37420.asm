; DESCRIPTION: Composite: Draws a magenta rectangle at (236, 178) with width 73 and height 71 then Places a white dot at position (105, 188) then Renders a cyan disk with center (419, 155) and radius 18.
; PLAN: r0=236(x), r1=178(y), r2=73(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x), r6=188(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=419(x), r11=155(y), r12=18(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 236
LDI r1, 178
LDI r2, 73
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 188
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 419
LDI r11, 155
LDI r12, 18
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
