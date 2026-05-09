; DESCRIPTION: Composite: Draws a purple rectangle at (297, 24) with width 101 and height 37 then Sets a single blue pixel at (198, 149).
; PLAN: r0=297(x), r1=24(y), r2=101(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=149(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 297
LDI r1, 24
LDI r2, 101
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 149
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
