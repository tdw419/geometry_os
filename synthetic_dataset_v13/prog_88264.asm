; DESCRIPTION: Composite: Draws a magenta circle centered at (209, 97) with radius 51 then Places a purple 72x98 rectangle at position (437, 156) then Sets a single green pixel at (164, 159).
; PLAN: r0=209(x), r1=97(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x), r6=156(y), r7=72(width), r8=98(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=164(x), r11=159(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 209
LDI r1, 97
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 156
LDI r7, 72
LDI r8, 98
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 159
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
