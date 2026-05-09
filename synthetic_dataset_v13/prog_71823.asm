; DESCRIPTION: Composite: Draws a green rectangle at (307, 41) with width 32 and height 112 then Places a yellow line segment connecting (402, 109) to (302, 184) then Places a cyan dot at position (306, 136).
; PLAN: r0=307(x), r1=41(y), r2=32(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x1), r6=109(y1), r7=302(x2), r8=184(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=306(x), r11=136(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 307
LDI r1, 41
LDI r2, 32
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 109
LDI r7, 302
LDI r8, 184
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 136
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
