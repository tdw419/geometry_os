; DESCRIPTION: Draws a black rectangle at (270, 103) with width 71 and height 27.
; PLAN: r0=270(x), r1=103(y), r2=71(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 103
LDI r2, 71
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
