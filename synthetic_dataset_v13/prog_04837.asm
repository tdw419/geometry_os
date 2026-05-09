; DESCRIPTION: Draws a purple rectangle at (301, 102) with width 78 and height 16.
; PLAN: r0=301(x), r1=102(y), r2=78(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 102
LDI r2, 78
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
