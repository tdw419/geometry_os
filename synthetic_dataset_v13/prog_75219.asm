; DESCRIPTION: Composite: Places a white 22x53 rectangle at position (207, 23) then Renders a magenta line between points (383, 19) and (38, 163) then Renders a black disk with center (147, 174) and radius 58.
; PLAN: r0=207(x), r1=23(y), r2=22(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x1), r6=19(y1), r7=38(x2), r8=163(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=147(x), r11=174(y), r12=58(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 207
LDI r1, 23
LDI r2, 22
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 19
LDI r7, 38
LDI r8, 163
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 174
LDI r12, 58
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
