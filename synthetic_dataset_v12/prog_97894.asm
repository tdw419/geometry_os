; DESCRIPTION: Draws a black rectangle at (283, 24) with width 28 and height 47.
; PLAN: r0=283(x), r1=24(y), r2=28(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 24
LDI r2, 28
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
