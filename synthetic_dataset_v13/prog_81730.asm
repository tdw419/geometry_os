; DESCRIPTION: Composite: Draws a green circle centered at (227, 142) with radius 53 then Draws a red rectangle at (82, 108) with width 82 and height 26 then Sets a single magenta pixel at (97, 49).
; PLAN: r0=227(x), r1=142(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=82(x), r6=108(y), r7=82(width), r8=26(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=97(x), r11=49(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 227
LDI r1, 142
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 82
LDI r6, 108
LDI r7, 82
LDI r8, 26
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 49
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
