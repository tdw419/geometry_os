; DESCRIPTION: Draws a purple rectangle at (157, 46) with width 57 and height 48.
; PLAN: r0=157(x), r1=46(y), r2=57(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 46
LDI r2, 57
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
