; DESCRIPTION: Composite: Draws a blue circle centered at (165, 206) with radius 11 then Places a purple dot at position (406, 138) then Draws a blue rectangle at (327, 192) with width 86 and height 57.
; PLAN: r0=165(x), r1=206(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=138(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=327(x), r11=192(y), r12=86(width), r13=57(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 206
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 138
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 327
LDI r11, 192
LDI r12, 86
LDI r13, 57
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
