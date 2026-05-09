; DESCRIPTION: Composite: Creates a blue circular shape at (134, 154) with radius 48 then Draws a blue line from (140, 249) to (423, 2) then Places a purple 21x18 rectangle at position (148, 58).
; PLAN: r0=134(x), r1=154(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x1), r6=249(y1), r7=423(x2), r8=2(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=148(x), r11=58(y), r12=21(width), r13=18(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 154
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 249
LDI r7, 423
LDI r8, 2
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 58
LDI r12, 21
LDI r13, 18
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
