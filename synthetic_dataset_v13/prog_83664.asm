; DESCRIPTION: Draws a black rectangle at (216, 17) with width 27 and height 19.
; PLAN: r0=216(x), r1=17(y), r2=27(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 17
LDI r2, 27
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
