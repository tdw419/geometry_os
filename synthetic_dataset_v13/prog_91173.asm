; DESCRIPTION: Draws a black rectangle at (256, 78) with width 56 and height 61.
; PLAN: r0=256(x), r1=78(y), r2=56(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 78
LDI r2, 56
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
