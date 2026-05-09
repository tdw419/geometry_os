; DESCRIPTION: Composite: Sets a single red pixel at (467, 15) then Places a green circle of radius 39 at center (431, 82) then Draws a red rectangle at (10, 128) with width 60 and height 77.
; PLAN: r0=467(x), r1=15(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=431(x), r6=82(y), r7=39(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=10(x), r11=128(y), r12=60(width), r13=77(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 467
LDI r1, 15
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 431
LDI r6, 82
LDI r7, 39
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 10
LDI r11, 128
LDI r12, 60
LDI r13, 77
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
