; DESCRIPTION: Composite: Draws a yellow circle centered at (362, 107) with radius 67 then Places a blue line segment connecting (226, 195) to (55, 212) then Places a black 31x33 rectangle at position (341, 113).
; PLAN: r0=362(x), r1=107(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x1), r6=195(y1), r7=55(x2), r8=212(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=113(y), r12=31(width), r13=33(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 107
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 195
LDI r7, 55
LDI r8, 212
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 113
LDI r12, 31
LDI r13, 33
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
