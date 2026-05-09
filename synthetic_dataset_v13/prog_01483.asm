; DESCRIPTION: Composite: Draws a white rectangle at (315, 16) with width 50 and height 30 then Sets a single blue pixel at (143, 197).
; PLAN: r0=315(x), r1=16(y), r2=50(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=197(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 315
LDI r1, 16
LDI r2, 50
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 197
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
