; DESCRIPTION: Composite: Sets a single purple pixel at (248, 244) then Draws a orange line from (244, 8) to (471, 200) then Draws a blue rectangle at (100, 168) with width 103 and height 45.
; PLAN: r0=248(x), r1=244(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=244(x1), r6=8(y1), r7=471(x2), r8=200(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=100(x), r11=168(y), r12=103(width), r13=45(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 244
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 244
LDI r6, 8
LDI r7, 471
LDI r8, 200
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 168
LDI r12, 103
LDI r13, 45
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
