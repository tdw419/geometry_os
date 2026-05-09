; DESCRIPTION: Composite: Draws a white line from (64, 31) to (137, 129) then Draws a orange circle centered at (120, 101) with radius 70 then Creates a black rectangular region at (328, 104) spanning 115 by 101 pixels.
; PLAN: r0=64(x1), r1=31(y1), r2=137(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=120(x), r6=101(y), r7=70(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=328(x), r11=104(y), r12=115(width), r13=101(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 31
LDI r2, 137
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 101
LDI r7, 70
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 328
LDI r11, 104
LDI r12, 115
LDI r13, 101
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
