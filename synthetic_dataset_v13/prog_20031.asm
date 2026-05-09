; DESCRIPTION: Draws a orange rectangle at (138, 92) with width 68 and height 33.
; PLAN: r0=138(x), r1=92(y), r2=68(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 92
LDI r2, 68
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
