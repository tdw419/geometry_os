; DESCRIPTION: Composite: Renders a magenta line between points (385, 226) and (231, 235) then Draws a orange rectangle at (375, 51) with width 49 and height 29 then Places a magenta circle of radius 46 at center (299, 86).
; PLAN: r0=385(x1), r1=226(y1), r2=231(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=51(y), r7=49(width), r8=29(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=299(x), r11=86(y), r12=46(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 226
LDI r2, 231
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 51
LDI r7, 49
LDI r8, 29
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 86
LDI r12, 46
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
