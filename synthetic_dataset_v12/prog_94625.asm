; DESCRIPTION: Composite: Places a white circle of radius 26 at center (228, 123) then Draws a blue rectangle at (436, 18) with width 68 and height 105 then Renders a orange line between points (209, 115) and (362, 31).
; PLAN: r0=228(x), r1=123(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x), r6=18(y), r7=68(width), r8=105(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=209(x1), r11=115(y1), r12=362(x2), r13=31(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 123
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 18
LDI r7, 68
LDI r8, 105
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 115
LDI r12, 362
LDI r13, 31
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
