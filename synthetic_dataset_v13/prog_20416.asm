; DESCRIPTION: Composite: Creates a blue rectangular region at (36, 121) spanning 28 by 17 pixels then Creates a cyan circular shape at (274, 150) with radius 55 then Draws a orange line from (98, 238) to (304, 0).
; PLAN: r0=36(x), r1=121(y), r2=28(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x), r6=150(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=98(x1), r11=238(y1), r12=304(x2), r13=0(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 121
LDI r2, 28
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 150
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 98
LDI r11, 238
LDI r12, 304
LDI r13, 0
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
