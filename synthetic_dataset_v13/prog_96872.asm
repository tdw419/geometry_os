; DESCRIPTION: Draws a purple rectangle at (184, 143) with width 76 and height 61.
; PLAN: r0=184(x), r1=143(y), r2=76(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 143
LDI r2, 76
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
