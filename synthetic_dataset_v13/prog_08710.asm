; DESCRIPTION: Composite: Draws a black line from (268, 57) to (4, 2) then Places a yellow 13x116 rectangle at position (439, 39) then Draws a black circle centered at (423, 189) with radius 67.
; PLAN: r0=268(x1), r1=57(y1), r2=4(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=39(y), r7=13(width), r8=116(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=423(x), r11=189(y), r12=67(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 268
LDI r1, 57
LDI r2, 4
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 39
LDI r7, 13
LDI r8, 116
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 423
LDI r11, 189
LDI r12, 67
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
