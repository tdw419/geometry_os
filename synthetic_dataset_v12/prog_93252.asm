; DESCRIPTION: Draws a purple rectangle at (294, 135) with width 61 and height 61.
; PLAN: r0=294(x), r1=135(y), r2=61(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 135
LDI r2, 61
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
