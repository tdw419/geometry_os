; DESCRIPTION: Draws a black rectangle at (421, 80) with width 23 and height 27.
; PLAN: r0=421(x), r1=80(y), r2=23(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 80
LDI r2, 23
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
