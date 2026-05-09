; DESCRIPTION: Composite: Places a black dot at position (97, 215) then Creates a red rectangular region at (230, 47) spanning 119 by 56 pixels then Places a yellow circle of radius 32 at center (319, 75).
; PLAN: r0=97(x), r1=215(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=47(y), r7=119(width), r8=56(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=319(x), r11=75(y), r12=32(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 97
LDI r1, 215
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 230
LDI r6, 47
LDI r7, 119
LDI r8, 56
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 75
LDI r12, 32
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
