; DESCRIPTION: Composite: Draws a green rectangle at (310, 20) with width 118 and height 12 then Renders a cyan line between points (391, 28) and (41, 94) then Places a blue dot at position (287, 122).
; PLAN: r0=310(x), r1=20(y), r2=118(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x1), r6=28(y1), r7=41(x2), r8=94(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=287(x), r11=122(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 310
LDI r1, 20
LDI r2, 118
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 28
LDI r7, 41
LDI r8, 94
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 122
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
