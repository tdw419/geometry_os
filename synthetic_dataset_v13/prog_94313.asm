; DESCRIPTION: Composite: Draws a blue rectangle at (197, 136) with width 88 and height 117 then Places a red circle of radius 52 at center (220, 80) then Places a yellow dot at position (136, 163).
; PLAN: r0=197(x), r1=136(y), r2=88(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x), r6=80(y), r7=52(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=136(x), r11=163(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 197
LDI r1, 136
LDI r2, 88
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 80
LDI r7, 52
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 136
LDI r11, 163
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
