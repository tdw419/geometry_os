; DESCRIPTION: Composite: Places a red dot at position (290, 97) then Places a red 35x79 rectangle at position (477, 171) then Creates a magenta circular shape at (408, 141) with radius 62.
; PLAN: r0=290(x), r1=97(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=477(x), r6=171(y), r7=35(width), r8=79(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x), r11=141(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 97
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 477
LDI r6, 171
LDI r7, 35
LDI r8, 79
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 141
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
