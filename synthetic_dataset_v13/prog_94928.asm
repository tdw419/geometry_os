; DESCRIPTION: Composite: Creates a purple circular shape at (87, 77) with radius 32 then Places a orange 108x85 rectangle at position (121, 163) then Draws a black line from (154, 244) to (359, 193).
; PLAN: r0=87(x), r1=77(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x), r6=163(y), r7=108(width), r8=85(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=154(x1), r11=244(y1), r12=359(x2), r13=193(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 77
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 163
LDI r7, 108
LDI r8, 85
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 244
LDI r12, 359
LDI r13, 193
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
