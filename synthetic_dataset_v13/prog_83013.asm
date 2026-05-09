; DESCRIPTION: Draws a orange rectangle at (191, 28) with width 68 and height 76.
; PLAN: r0=191(x), r1=28(y), r2=68(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 28
LDI r2, 68
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
