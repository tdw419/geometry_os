; DESCRIPTION: Draws a black rectangle at (263, 39) with width 51 and height 71.
; PLAN: r0=263(x), r1=39(y), r2=51(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 39
LDI r2, 51
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
