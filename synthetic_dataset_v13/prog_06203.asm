; DESCRIPTION: Draws a black rectangle at (426, 130) with width 27 and height 112.
; PLAN: r0=426(x), r1=130(y), r2=27(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 130
LDI r2, 27
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
