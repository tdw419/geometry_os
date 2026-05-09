; DESCRIPTION: Composite: Draws a orange line from (42, 233) to (414, 114) then Draws a cyan circle centered at (156, 181) with radius 43 then Creates a black rectangular region at (224, 50) spanning 52 by 103 pixels.
; PLAN: r0=42(x1), r1=233(y1), r2=414(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=181(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=224(x), r11=50(y), r12=52(width), r13=103(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 233
LDI r2, 414
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 181
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 224
LDI r11, 50
LDI r12, 52
LDI r13, 103
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
