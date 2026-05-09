; DESCRIPTION: Composite: Renders a red box of size 37x16 starting at (425, 121) then Places a purple dot at position (414, 234) then Draws a magenta circle centered at (219, 119) with radius 41.
; PLAN: r0=425(x), r1=121(y), r2=37(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=414(x), r6=234(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=219(x), r11=119(y), r12=41(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 425
LDI r1, 121
LDI r2, 37
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 234
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 219
LDI r11, 119
LDI r12, 41
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
