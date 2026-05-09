; DESCRIPTION: Draws a orange rectangle at (191, 135) with width 18 and height 109.
; PLAN: r0=191(x), r1=135(y), r2=18(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 135
LDI r2, 18
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
