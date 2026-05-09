; DESCRIPTION: Composite: Draws a cyan rectangle at (329, 107) with width 67 and height 47 then Renders a magenta disk with center (324, 109) and radius 60 then Places a purple line segment connecting (123, 103) to (389, 43).
; PLAN: r0=329(x), r1=107(y), r2=67(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x), r6=109(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=123(x1), r11=103(y1), r12=389(x2), r13=43(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 107
LDI r2, 67
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 109
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 123
LDI r11, 103
LDI r12, 389
LDI r13, 43
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
