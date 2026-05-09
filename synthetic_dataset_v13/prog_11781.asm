; DESCRIPTION: Draws a purple rectangle at (410, 134) with width 14 and height 112.
; PLAN: r0=410(x), r1=134(y), r2=14(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 134
LDI r2, 14
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
