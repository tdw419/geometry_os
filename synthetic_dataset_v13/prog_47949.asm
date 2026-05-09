; DESCRIPTION: Composite: Draws a blue circle centered at (437, 84) with radius 73 then Places a white dot at position (408, 181) then Renders a red box of size 96x15 starting at (180, 131).
; PLAN: r0=437(x), r1=84(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=408(x), r6=181(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=180(x), r11=131(y), r12=96(width), r13=15(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 437
LDI r1, 84
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 408
LDI r6, 181
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 180
LDI r11, 131
LDI r12, 96
LDI r13, 15
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
