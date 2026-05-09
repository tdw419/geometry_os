; DESCRIPTION: Draws a orange rectangle at (156, 130) with width 52 and height 38.
; PLAN: r0=156(x), r1=130(y), r2=52(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 130
LDI r2, 52
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
