; DESCRIPTION: Draws a blue rectangle at (76, 98) with width 52 and height 97.
; PLAN: r0=76(x), r1=98(y), r2=52(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 98
LDI r2, 52
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
