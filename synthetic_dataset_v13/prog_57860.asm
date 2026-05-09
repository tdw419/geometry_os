; DESCRIPTION: Draws a purple rectangle at (156, 16) with width 45 and height 14.
; PLAN: r0=156(x), r1=16(y), r2=45(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 16
LDI r2, 45
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
