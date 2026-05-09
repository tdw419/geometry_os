; DESCRIPTION: Composite: Draws a black rectangle at (45, 93) with width 114 and height 114 then Sets a single green pixel at (356, 29) then Places a orange circle of radius 53 at center (198, 93).
; PLAN: r0=45(x), r1=93(y), r2=114(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x), r6=29(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=198(x), r11=93(y), r12=53(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 45
LDI r1, 93
LDI r2, 114
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 29
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 198
LDI r11, 93
LDI r12, 53
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
