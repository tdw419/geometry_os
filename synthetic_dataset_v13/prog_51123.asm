; DESCRIPTION: Composite: Draws a blue circle centered at (267, 172) with radius 23 then Places a blue 101x50 rectangle at position (277, 175) then Places a green line segment connecting (46, 115) to (383, 182).
; PLAN: r0=267(x), r1=172(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=277(x), r6=175(y), r7=101(width), r8=50(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=46(x1), r11=115(y1), r12=383(x2), r13=182(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 172
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 277
LDI r6, 175
LDI r7, 101
LDI r8, 50
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 115
LDI r12, 383
LDI r13, 182
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
