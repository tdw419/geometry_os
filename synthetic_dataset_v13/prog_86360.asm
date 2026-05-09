; DESCRIPTION: Composite: Draws a white line from (316, 213) to (253, 248) then Creates a yellow circular shape at (72, 146) with radius 64 then Creates a purple rectangular region at (284, 206) spanning 94 by 17 pixels.
; PLAN: r0=316(x1), r1=213(y1), r2=253(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=146(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x), r11=206(y), r12=94(width), r13=17(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 213
LDI r2, 253
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 146
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 206
LDI r12, 94
LDI r13, 17
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
