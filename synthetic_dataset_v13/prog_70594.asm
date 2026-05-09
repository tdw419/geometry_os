; DESCRIPTION: Composite: Places a red 107x21 rectangle at position (268, 145) then Draws a black circle centered at (368, 186) with radius 61 then Places a purple dot at position (127, 104).
; PLAN: r0=268(x), r1=145(y), r2=107(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=186(y), r7=61(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=127(x), r11=104(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 268
LDI r1, 145
LDI r2, 107
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 186
LDI r7, 61
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 127
LDI r11, 104
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
