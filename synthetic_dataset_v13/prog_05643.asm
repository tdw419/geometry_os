; DESCRIPTION: Draws a purple rectangle at (299, 171) with width 98 and height 71.
; PLAN: r0=299(x), r1=171(y), r2=98(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 171
LDI r2, 98
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
