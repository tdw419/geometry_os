; DESCRIPTION: Draws a orange rectangle at (124, 140) with width 11 and height 109.
; PLAN: r0=124(x), r1=140(y), r2=11(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 140
LDI r2, 11
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
