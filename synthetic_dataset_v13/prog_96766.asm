; DESCRIPTION: Composite: Draws a red line from (390, 238) to (230, 48) then Creates a cyan circular shape at (308, 231) with radius 24 then Creates a red rectangular region at (227, 162) spanning 97 by 10 pixels.
; PLAN: r0=390(x1), r1=238(y1), r2=230(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=231(y), r7=24(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=227(x), r11=162(y), r12=97(width), r13=10(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 390
LDI r1, 238
LDI r2, 230
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 231
LDI r7, 24
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 227
LDI r11, 162
LDI r12, 97
LDI r13, 10
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
