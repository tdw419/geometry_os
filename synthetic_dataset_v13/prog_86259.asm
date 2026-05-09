; DESCRIPTION: Composite: Renders a magenta disk with center (438, 202) and radius 44 then Renders a black line between points (152, 101) and (383, 104) then Places a red 44x115 rectangle at position (411, 110).
; PLAN: r0=438(x), r1=202(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x1), r6=101(y1), r7=383(x2), r8=104(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=411(x), r11=110(y), r12=44(width), r13=115(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 202
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 101
LDI r7, 383
LDI r8, 104
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 110
LDI r12, 44
LDI r13, 115
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
