; DESCRIPTION: Composite: Draws a blue rectangle at (411, 74) with width 91 and height 71 then Places a green dot at position (168, 255) then Places a orange circle of radius 18 at center (58, 70).
; PLAN: r0=411(x), r1=74(y), r2=91(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x), r6=255(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=58(x), r11=70(y), r12=18(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 411
LDI r1, 74
LDI r2, 91
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 255
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 58
LDI r11, 70
LDI r12, 18
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
