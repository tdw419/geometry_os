; DESCRIPTION: Composite: Places a magenta dot at position (221, 94) then Creates a white rectangular region at (311, 4) spanning 107 by 89 pixels then Creates a orange circular shape at (308, 99) with radius 42.
; PLAN: r0=221(x), r1=94(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=4(y), r7=107(width), r8=89(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=308(x), r11=99(y), r12=42(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 221
LDI r1, 94
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 311
LDI r6, 4
LDI r7, 107
LDI r8, 89
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 99
LDI r12, 42
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
