; DESCRIPTION: Composite: Draws a orange line from (326, 208) to (161, 228) then Places a white 90x96 rectangle at position (412, 104) then Creates a purple circular shape at (458, 69) with radius 45.
; PLAN: r0=326(x1), r1=208(y1), r2=161(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=412(x), r6=104(y), r7=90(width), r8=96(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=458(x), r11=69(y), r12=45(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 326
LDI r1, 208
LDI r2, 161
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 104
LDI r7, 90
LDI r8, 96
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 69
LDI r12, 45
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
