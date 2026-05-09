; DESCRIPTION: Composite: Places a black 47x73 rectangle at position (213, 153) then Renders a black disk with center (165, 128) and radius 75 then Places a orange line segment connecting (117, 149) to (297, 14).
; PLAN: r0=213(x), r1=153(y), r2=47(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x), r6=128(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x1), r11=149(y1), r12=297(x2), r13=14(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 153
LDI r2, 47
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 128
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 149
LDI r12, 297
LDI r13, 14
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
