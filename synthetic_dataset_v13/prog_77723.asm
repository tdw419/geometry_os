; DESCRIPTION: Composite: Draws a white line from (227, 121) to (321, 42) then Places a cyan 71x67 rectangle at position (312, 42) then Draws a orange circle centered at (251, 101) with radius 43.
; PLAN: r0=227(x1), r1=121(y1), r2=321(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=42(y), r7=71(width), r8=67(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=251(x), r11=101(y), r12=43(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 227
LDI r1, 121
LDI r2, 321
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 42
LDI r7, 71
LDI r8, 67
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 101
LDI r12, 43
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
