; DESCRIPTION: Draws a purple rectangle at (295, 78) with width 33 and height 76.
; PLAN: r0=295(x), r1=78(y), r2=33(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 78
LDI r2, 33
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
