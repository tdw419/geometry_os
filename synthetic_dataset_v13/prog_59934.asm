; DESCRIPTION: Draws a purple rectangle at (425, 59) with width 34 and height 49.
; PLAN: r0=425(x), r1=59(y), r2=34(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 59
LDI r2, 34
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
