; DESCRIPTION: Composite: Places a magenta circle of radius 45 at center (74, 199) then Draws a black rectangle at (268, 1) with width 34 and height 32 then Draws a purple line from (214, 128) to (8, 19).
; PLAN: r0=74(x), r1=199(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x), r6=1(y), r7=34(width), r8=32(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=214(x1), r11=128(y1), r12=8(x2), r13=19(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 199
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 1
LDI r7, 34
LDI r8, 32
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 128
LDI r12, 8
LDI r13, 19
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
