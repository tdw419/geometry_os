; DESCRIPTION: Draws a black rectangle at (226, 28) with width 28 and height 61.
; PLAN: r0=226(x), r1=28(y), r2=28(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 28
LDI r2, 28
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
