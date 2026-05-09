; DESCRIPTION: Draws a orange rectangle at (414, 205) with width 68 and height 15.
; PLAN: r0=414(x), r1=205(y), r2=68(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 205
LDI r2, 68
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
