; DESCRIPTION: Composite: Places a yellow 68x56 rectangle at position (143, 177) then Places a yellow dot at position (344, 49) then Draws a white circle centered at (413, 72) with radius 34.
; PLAN: r0=143(x), r1=177(y), r2=68(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x), r6=49(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=413(x), r11=72(y), r12=34(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 143
LDI r1, 177
LDI r2, 68
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 49
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 413
LDI r11, 72
LDI r12, 34
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
