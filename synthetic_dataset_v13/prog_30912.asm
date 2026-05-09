; DESCRIPTION: Draws a orange rectangle at (102, 15) with width 72 and height 16.
; PLAN: r0=102(x), r1=15(y), r2=72(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 15
LDI r2, 72
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
