; DESCRIPTION: Composite: Draws a white rectangle at (351, 120) with width 104 and height 119 then Places a cyan dot at position (327, 164).
; PLAN: r0=351(x), r1=120(y), r2=104(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=164(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 351
LDI r1, 120
LDI r2, 104
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 164
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
