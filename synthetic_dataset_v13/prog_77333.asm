; DESCRIPTION: Draws a black rectangle at (74, 145) with width 28 and height 27.
; PLAN: r0=74(x), r1=145(y), r2=28(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 145
LDI r2, 28
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
