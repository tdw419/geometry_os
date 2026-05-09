; DESCRIPTION: Composite: Renders a black disk with center (103, 66) and radius 58 then Places a magenta 49x33 rectangle at position (215, 12) then Draws a red line from (60, 70) to (119, 239).
; PLAN: r0=103(x), r1=66(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x), r6=12(y), r7=49(width), r8=33(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=60(x1), r11=70(y1), r12=119(x2), r13=239(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 66
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 12
LDI r7, 49
LDI r8, 33
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 70
LDI r12, 119
LDI r13, 239
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
