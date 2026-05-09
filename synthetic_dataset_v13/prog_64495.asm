; DESCRIPTION: Composite: Draws a orange circle centered at (165, 172) with radius 77 then Places a purple 39x95 rectangle at position (177, 148) then Places a green line segment connecting (43, 16) to (256, 182).
; PLAN: r0=165(x), r1=172(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x), r6=148(y), r7=39(width), r8=95(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=43(x1), r11=16(y1), r12=256(x2), r13=182(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 172
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 148
LDI r7, 39
LDI r8, 95
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 43
LDI r11, 16
LDI r12, 256
LDI r13, 182
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
