; DESCRIPTION: Draws a purple rectangle at (393, 42) with width 83 and height 119.
; PLAN: r0=393(x), r1=42(y), r2=83(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 42
LDI r2, 83
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
