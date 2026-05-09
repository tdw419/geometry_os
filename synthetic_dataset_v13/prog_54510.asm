; DESCRIPTION: Composite: Places a red circle of radius 12 at center (308, 78) then Places a purple 82x16 rectangle at position (248, 168) then Renders a black line between points (65, 104) and (219, 246).
; PLAN: r0=308(x), r1=78(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=168(y), r7=82(width), r8=16(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=65(x1), r11=104(y1), r12=219(x2), r13=246(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 78
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 168
LDI r7, 82
LDI r8, 16
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 65
LDI r11, 104
LDI r12, 219
LDI r13, 246
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
