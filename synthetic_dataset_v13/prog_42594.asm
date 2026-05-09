; DESCRIPTION: Composite: Draws a yellow circle centered at (116, 152) with radius 45 then Places a black 31x54 rectangle at position (315, 9) then Places a magenta line segment connecting (257, 77) to (7, 141).
; PLAN: r0=116(x), r1=152(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x), r6=9(y), r7=31(width), r8=54(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=257(x1), r11=77(y1), r12=7(x2), r13=141(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 152
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 9
LDI r7, 31
LDI r8, 54
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 77
LDI r12, 7
LDI r13, 141
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
