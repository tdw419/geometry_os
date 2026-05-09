; DESCRIPTION: Composite: Draws a purple rectangle at (268, 73) with width 79 and height 72 then Places a purple dot at position (446, 127) then Places a orange circle of radius 31 at center (126, 77).
; PLAN: r0=268(x), r1=73(y), r2=79(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=127(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=126(x), r11=77(y), r12=31(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 268
LDI r1, 73
LDI r2, 79
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 127
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 126
LDI r11, 77
LDI r12, 31
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
