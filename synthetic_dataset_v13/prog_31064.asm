; DESCRIPTION: Composite: Draws a blue rectangle at (43, 30) with width 36 and height 114 then Renders a green line between points (51, 159) and (101, 36) then Places a blue dot at position (456, 203).
; PLAN: r0=43(x), r1=30(y), r2=36(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=51(x1), r6=159(y1), r7=101(x2), r8=36(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=456(x), r11=203(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 43
LDI r1, 30
LDI r2, 36
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 159
LDI r7, 101
LDI r8, 36
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 203
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
