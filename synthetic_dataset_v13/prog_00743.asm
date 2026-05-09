; DESCRIPTION: Draws a purple rectangle at (294, 73) with width 72 and height 85.
; PLAN: r0=294(x), r1=73(y), r2=72(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 73
LDI r2, 72
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
