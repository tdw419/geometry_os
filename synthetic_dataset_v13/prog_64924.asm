; DESCRIPTION: Draws a black rectangle at (15, 33) with width 71 and height 68.
; PLAN: r0=15(x), r1=33(y), r2=71(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 33
LDI r2, 71
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
