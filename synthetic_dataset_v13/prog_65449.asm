; DESCRIPTION: Composite: Creates a black circular shape at (194, 117) with radius 44 then Draws a magenta rectangle at (109, 108) with width 93 and height 97 then Sets a single magenta pixel at (443, 143).
; PLAN: r0=194(x), r1=117(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=108(y), r7=93(width), r8=97(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=443(x), r11=143(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 194
LDI r1, 117
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 108
LDI r7, 93
LDI r8, 97
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 143
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
