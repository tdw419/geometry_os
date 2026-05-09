; DESCRIPTION: Composite: Places a white line segment connecting (255, 146) to (177, 104) then Draws a orange circle centered at (109, 191) with radius 60 then Places a yellow 81x65 rectangle at position (368, 168).
; PLAN: r0=255(x1), r1=146(y1), r2=177(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=191(y), r7=60(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=368(x), r11=168(y), r12=81(width), r13=65(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 146
LDI r2, 177
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 191
LDI r7, 60
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 368
LDI r11, 168
LDI r12, 81
LDI r13, 65
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
