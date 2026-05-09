; DESCRIPTION: Draws a orange rectangle at (183, 184) with width 55 and height 72.
; PLAN: r0=183(x), r1=184(y), r2=55(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 184
LDI r2, 55
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
