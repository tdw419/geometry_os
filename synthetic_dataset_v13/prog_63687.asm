; DESCRIPTION: Draws a purple rectangle at (340, 61) with width 16 and height 78.
; PLAN: r0=340(x), r1=61(y), r2=16(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 61
LDI r2, 16
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
