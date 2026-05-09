; DESCRIPTION: Composite: Creates a yellow rectangular region at (72, 169) spanning 114 by 82 pixels then Draws a green circle centered at (358, 98) with radius 63 then Places a green dot at position (333, 24).
; PLAN: r0=72(x), r1=169(y), r2=114(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x), r6=98(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=333(x), r11=24(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 72
LDI r1, 169
LDI r2, 114
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 98
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 333
LDI r11, 24
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
