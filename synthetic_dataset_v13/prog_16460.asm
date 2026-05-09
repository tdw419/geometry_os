; DESCRIPTION: Draws a blue rectangle at (265, 61) with width 52 and height 105.
; PLAN: r0=265(x), r1=61(y), r2=52(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 61
LDI r2, 52
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
