; DESCRIPTION: Composite: Places a green dot at position (430, 227) then Draws a magenta rectangle at (70, 24) with width 54 and height 66 then Places a purple circle of radius 50 at center (171, 112).
; PLAN: r0=430(x), r1=227(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=70(x), r6=24(y), r7=54(width), r8=66(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=171(x), r11=112(y), r12=50(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 430
LDI r1, 227
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 70
LDI r6, 24
LDI r7, 54
LDI r8, 66
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 112
LDI r12, 50
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
