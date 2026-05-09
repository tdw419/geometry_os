; DESCRIPTION: Composite: Places a yellow circle of radius 22 at center (200, 122) then Draws a green rectangle at (284, 188) with width 85 and height 67 then Places a white dot at position (126, 9).
; PLAN: r0=200(x), r1=122(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=188(y), r7=85(width), r8=67(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=126(x), r11=9(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 200
LDI r1, 122
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 188
LDI r7, 85
LDI r8, 67
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 9
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
