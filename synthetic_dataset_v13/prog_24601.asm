; DESCRIPTION: Draws a black rectangle at (358, 5) with width 40 and height 71.
; PLAN: r0=358(x), r1=5(y), r2=40(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 5
LDI r2, 40
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
