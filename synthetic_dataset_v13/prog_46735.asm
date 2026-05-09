; DESCRIPTION: Draws a purple rectangle at (294, 125) with width 108 and height 94.
; PLAN: r0=294(x), r1=125(y), r2=108(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 125
LDI r2, 108
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
