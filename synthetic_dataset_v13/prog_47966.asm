; DESCRIPTION: Draws a black rectangle at (156, 130) with width 55 and height 56.
; PLAN: r0=156(x), r1=130(y), r2=55(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 130
LDI r2, 55
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
