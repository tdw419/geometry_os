; DESCRIPTION: Draws a orange rectangle at (58, 130) with width 11 and height 87.
; PLAN: r0=58(x), r1=130(y), r2=11(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 130
LDI r2, 11
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
