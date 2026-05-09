; DESCRIPTION: Composite: Places a black dot at position (467, 183) then Draws a red rectangle at (37, 220) with width 64 and height 30 then Draws a white circle centered at (61, 85) with radius 31.
; PLAN: r0=467(x), r1=183(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=37(x), r6=220(y), r7=64(width), r8=30(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=61(x), r11=85(y), r12=31(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 467
LDI r1, 183
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 37
LDI r6, 220
LDI r7, 64
LDI r8, 30
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 85
LDI r12, 31
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
