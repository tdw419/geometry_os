; DESCRIPTION: Composite: Draws a magenta rectangle at (72, 96) with width 50 and height 88 then Places a red dot at position (237, 234) then Places a black circle of radius 11 at center (433, 225).
; PLAN: r0=72(x), r1=96(y), r2=50(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x), r6=234(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=433(x), r11=225(y), r12=11(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 72
LDI r1, 96
LDI r2, 50
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 234
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 433
LDI r11, 225
LDI r12, 11
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
