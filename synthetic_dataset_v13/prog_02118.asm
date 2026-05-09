; DESCRIPTION: Composite: Draws a purple circle centered at (133, 190) with radius 36 then Creates a blue rectangular region at (7, 86) spanning 86 by 17 pixels then Places a magenta dot at position (98, 82).
; PLAN: r0=133(x), r1=190(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x), r6=86(y), r7=86(width), r8=17(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=98(x), r11=82(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 133
LDI r1, 190
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 86
LDI r7, 86
LDI r8, 17
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 82
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
