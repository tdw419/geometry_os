; DESCRIPTION: Composite: Draws a magenta rectangle at (184, 81) with width 111 and height 34 then Places a purple line segment connecting (472, 30) to (52, 136) then Places a green dot at position (493, 41).
; PLAN: r0=184(x), r1=81(y), r2=111(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=472(x1), r6=30(y1), r7=52(x2), r8=136(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=493(x), r11=41(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 184
LDI r1, 81
LDI r2, 111
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 30
LDI r7, 52
LDI r8, 136
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 493
LDI r11, 41
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
