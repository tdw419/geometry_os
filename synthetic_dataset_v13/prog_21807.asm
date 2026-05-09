; DESCRIPTION: Draws a black rectangle at (324, 21) with width 66 and height 59.
; PLAN: r0=324(x), r1=21(y), r2=66(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 21
LDI r2, 66
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
