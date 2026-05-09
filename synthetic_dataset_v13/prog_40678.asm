; DESCRIPTION: Composite: Draws a orange circle centered at (466, 64) with radius 19 then Places a green line segment connecting (316, 249) to (392, 176) then Places a blue 81x21 rectangle at position (289, 18).
; PLAN: r0=466(x), r1=64(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x1), r6=249(y1), r7=392(x2), r8=176(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=289(x), r11=18(y), r12=81(width), r13=21(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 466
LDI r1, 64
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 249
LDI r7, 392
LDI r8, 176
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 18
LDI r12, 81
LDI r13, 21
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
