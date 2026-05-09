; DESCRIPTION: Composite: Draws a white rectangle at (238, 46) with width 64 and height 119 then Places a black dot at position (402, 12).
; PLAN: r0=238(x), r1=46(y), r2=64(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=12(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 238
LDI r1, 46
LDI r2, 64
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 12
LDI r7, 0x000000
PSET r5, r6, r7
HALT
