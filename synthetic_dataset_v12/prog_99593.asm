; DESCRIPTION: Draws a black rectangle at (199, 76) with width 39 and height 34.
; PLAN: r0=199(x), r1=76(y), r2=39(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 76
LDI r2, 39
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
