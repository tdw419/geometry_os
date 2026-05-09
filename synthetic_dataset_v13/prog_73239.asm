; DESCRIPTION: Draws a purple rectangle at (108, 165) with width 40 and height 65.
; PLAN: r0=108(x), r1=165(y), r2=40(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 165
LDI r2, 40
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
