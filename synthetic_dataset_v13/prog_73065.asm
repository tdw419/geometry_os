; DESCRIPTION: Composite: Draws a red circle centered at (75, 120) with radius 60 then Creates a yellow rectangular region at (238, 147) spanning 94 by 77 pixels then Places a white dot at position (324, 151).
; PLAN: r0=75(x), r1=120(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=238(x), r6=147(y), r7=94(width), r8=77(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=324(x), r11=151(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 75
LDI r1, 120
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 238
LDI r6, 147
LDI r7, 94
LDI r8, 77
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 151
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
