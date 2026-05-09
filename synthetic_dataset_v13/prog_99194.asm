; DESCRIPTION: Composite: Draws a purple circle centered at (281, 162) with radius 20 then Places a blue 115x24 rectangle at position (208, 173) then Places a green line segment connecting (134, 220) to (313, 60).
; PLAN: r0=281(x), r1=162(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x), r6=173(y), r7=115(width), r8=24(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x1), r11=220(y1), r12=313(x2), r13=60(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 162
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 173
LDI r7, 115
LDI r8, 24
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 220
LDI r12, 313
LDI r13, 60
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
