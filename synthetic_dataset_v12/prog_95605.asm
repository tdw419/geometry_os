; DESCRIPTION: Composite: Draws a red rectangle at (385, 167) with width 82 and height 80 then Places a cyan circle of radius 17 at center (429, 181) then Draws a yellow line from (413, 123) to (5, 245).
; PLAN: r0=385(x), r1=167(y), r2=82(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=429(x), r6=181(y), r7=17(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=413(x1), r11=123(y1), r12=5(x2), r13=245(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 167
LDI r2, 82
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 181
LDI r7, 17
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 413
LDI r11, 123
LDI r12, 5
LDI r13, 245
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
