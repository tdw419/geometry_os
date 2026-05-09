; DESCRIPTION: Composite: Renders a orange box of size 74x19 starting at (215, 181) then Places a orange dot at position (218, 238) then Draws a yellow circle centered at (295, 127) with radius 62.
; PLAN: r0=215(x), r1=181(y), r2=74(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x), r6=238(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=295(x), r11=127(y), r12=62(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 215
LDI r1, 181
LDI r2, 74
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 238
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 295
LDI r11, 127
LDI r12, 62
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
