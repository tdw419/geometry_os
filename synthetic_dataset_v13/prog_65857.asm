; DESCRIPTION: Composite: Places a green dot at position (196, 46) then Draws a green rectangle at (284, 70) with width 74 and height 114 then Places a purple circle of radius 33 at center (40, 65).
; PLAN: r0=196(x), r1=46(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=70(y), r7=74(width), r8=114(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=40(x), r11=65(y), r12=33(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 196
LDI r1, 46
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 284
LDI r6, 70
LDI r7, 74
LDI r8, 114
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 65
LDI r12, 33
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
