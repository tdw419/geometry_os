; DESCRIPTION: Composite: Draws a purple line from (416, 15) to (372, 243) then Places a magenta 28x58 rectangle at position (332, 55) then Draws a black circle centered at (213, 107) with radius 77.
; PLAN: r0=416(x1), r1=15(y1), r2=372(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=55(y), r7=28(width), r8=58(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=213(x), r11=107(y), r12=77(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 416
LDI r1, 15
LDI r2, 372
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 55
LDI r7, 28
LDI r8, 58
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 107
LDI r12, 77
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
