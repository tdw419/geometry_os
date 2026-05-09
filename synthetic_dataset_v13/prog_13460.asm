; DESCRIPTION: Composite: Renders a orange line between points (511, 214) and (496, 50) then Places a blue 39x69 rectangle at position (284, 123) then Places a black dot at position (244, 206).
; PLAN: r0=511(x1), r1=214(y1), r2=496(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=123(y), r7=39(width), r8=69(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=244(x), r11=206(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 511
LDI r1, 214
LDI r2, 496
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 123
LDI r7, 39
LDI r8, 69
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 206
LDI r12, 0x000000
PSET r10, r11, r12
HALT
