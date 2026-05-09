; DESCRIPTION: Composite: Places a blue 77x43 rectangle at position (366, 38) then Sets a single red pixel at (349, 9) then Places a purple circle of radius 31 at center (284, 136).
; PLAN: r0=366(x), r1=38(y), r2=77(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x), r6=9(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=284(x), r11=136(y), r12=31(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 366
LDI r1, 38
LDI r2, 77
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 9
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 284
LDI r11, 136
LDI r12, 31
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
