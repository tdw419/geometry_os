; DESCRIPTION: Draws a orange rectangle at (203, 137) with width 92 and height 111.
; PLAN: r0=203(x), r1=137(y), r2=92(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 137
LDI r2, 92
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
