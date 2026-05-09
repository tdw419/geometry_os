; DESCRIPTION: Composite: Renders a orange line between points (4, 146) and (157, 15) then Draws a black rectangle at (86, 144) with width 43 and height 18 then Places a magenta dot at position (40, 255).
; PLAN: r0=4(x1), r1=146(y1), r2=157(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=144(y), r7=43(width), r8=18(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=40(x), r11=255(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 4
LDI r1, 146
LDI r2, 157
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 144
LDI r7, 43
LDI r8, 18
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 255
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
