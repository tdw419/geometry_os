; DESCRIPTION: Draws a black rectangle at (363, 68) with width 28 and height 112.
; PLAN: r0=363(x), r1=68(y), r2=28(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 68
LDI r2, 28
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
