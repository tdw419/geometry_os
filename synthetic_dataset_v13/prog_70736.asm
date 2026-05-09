; DESCRIPTION: Composite: Places a black 107x56 rectangle at position (178, 102) then Places a magenta dot at position (327, 229) then Draws a green circle centered at (412, 37) with radius 14.
; PLAN: r0=178(x), r1=102(y), r2=107(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=229(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=412(x), r11=37(y), r12=14(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 178
LDI r1, 102
LDI r2, 107
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 229
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 412
LDI r11, 37
LDI r12, 14
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
