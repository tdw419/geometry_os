; DESCRIPTION: Composite: Places a white dot at position (304, 26) then Draws a purple rectangle at (256, 93) with width 13 and height 88.
; PLAN: r0=304(x), r1=26(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=93(y), r7=13(width), r8=88(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 26
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 256
LDI r6, 93
LDI r7, 13
LDI r8, 88
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
