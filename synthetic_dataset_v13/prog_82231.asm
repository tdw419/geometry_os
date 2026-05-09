; DESCRIPTION: Composite: Draws a blue line from (96, 108) to (157, 24) then Places a white 47x35 rectangle at position (199, 15) then Creates a black circular shape at (208, 236) with radius 10.
; PLAN: r0=96(x1), r1=108(y1), r2=157(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=15(y), r7=47(width), r8=35(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x), r11=236(y), r12=10(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 96
LDI r1, 108
LDI r2, 157
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 15
LDI r7, 47
LDI r8, 35
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 236
LDI r12, 10
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
