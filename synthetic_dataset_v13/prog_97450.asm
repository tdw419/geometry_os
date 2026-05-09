; DESCRIPTION: Composite: Draws a white rectangle at (434, 206) with width 29 and height 30 then Sets a single blue pixel at (117, 7).
; PLAN: r0=434(x), r1=206(y), r2=29(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x), r6=7(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 434
LDI r1, 206
LDI r2, 29
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 7
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
