; DESCRIPTION: Composite: Draws a blue rectangle at (57, 66) with width 48 and height 67 then Places a purple dot at position (484, 244).
; PLAN: r0=57(x), r1=66(y), r2=48(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=484(x), r6=244(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 57
LDI r1, 66
LDI r2, 48
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 244
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
