; DESCRIPTION: Draws a purple rectangle at (298, 61) with width 34 and height 26.
; PLAN: r0=298(x), r1=61(y), r2=34(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 61
LDI r2, 34
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
