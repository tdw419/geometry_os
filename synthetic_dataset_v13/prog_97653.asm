; DESCRIPTION: Composite: Places a orange 70x104 rectangle at position (93, 39) then Places a red dot at position (468, 195) then Draws a red circle centered at (434, 104) with radius 32.
; PLAN: r0=93(x), r1=39(y), r2=70(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x), r6=195(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=434(x), r11=104(y), r12=32(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 93
LDI r1, 39
LDI r2, 70
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 195
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 434
LDI r11, 104
LDI r12, 32
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
