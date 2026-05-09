; DESCRIPTION: Composite: Draws a purple rectangle at (367, 143) with width 106 and height 67 then Places a red circle of radius 42 at center (321, 87).
; PLAN: r0=367(x), r1=143(y), r2=106(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x), r6=87(y), r7=42(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 367
LDI r1, 143
LDI r2, 106
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 87
LDI r7, 42
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
