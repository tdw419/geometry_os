; DESCRIPTION: Composite: Places a blue circle of radius 46 at center (207, 144) then Draws a purple rectangle at (274, 5) with width 117 and height 45 then Renders a magenta line between points (383, 82) and (74, 178).
; PLAN: r0=207(x), r1=144(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x), r6=5(y), r7=117(width), r8=45(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=383(x1), r11=82(y1), r12=74(x2), r13=178(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 144
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 5
LDI r7, 117
LDI r8, 45
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 82
LDI r12, 74
LDI r13, 178
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
