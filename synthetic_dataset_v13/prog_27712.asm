; DESCRIPTION: Draws a orange rectangle at (283, 62) with width 51 and height 76.
; PLAN: r0=283(x), r1=62(y), r2=51(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 62
LDI r2, 51
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
