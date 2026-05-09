; DESCRIPTION: Composite: Draws a white line from (137, 181) to (114, 183) then Places a cyan 54x21 rectangle at position (41, 161) then Creates a red circular shape at (173, 48) with radius 42.
; PLAN: r0=137(x1), r1=181(y1), r2=114(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=41(x), r6=161(y), r7=54(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=173(x), r11=48(y), r12=42(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 137
LDI r1, 181
LDI r2, 114
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 161
LDI r7, 54
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 48
LDI r12, 42
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
