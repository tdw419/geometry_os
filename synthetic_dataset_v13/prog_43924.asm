; DESCRIPTION: Composite: Draws a white rectangle at (423, 176) with width 46 and height 70 then Places a black dot at position (156, 151).
; PLAN: r0=423(x), r1=176(y), r2=46(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=151(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 423
LDI r1, 176
LDI r2, 46
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 151
LDI r7, 0x000000
PSET r5, r6, r7
HALT
