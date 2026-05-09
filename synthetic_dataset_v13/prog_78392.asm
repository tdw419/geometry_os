; DESCRIPTION: Composite: Draws a blue rectangle at (168, 141) with width 72 and height 105 then Places a white dot at position (50, 197) then Renders a blue disk with center (302, 135) and radius 38.
; PLAN: r0=168(x), r1=141(y), r2=72(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=50(x), r6=197(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=302(x), r11=135(y), r12=38(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 168
LDI r1, 141
LDI r2, 72
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 197
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 302
LDI r11, 135
LDI r12, 38
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
