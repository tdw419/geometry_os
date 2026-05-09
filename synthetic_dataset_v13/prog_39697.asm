; DESCRIPTION: Draws a orange rectangle at (236, 15) with width 18 and height 21.
; PLAN: r0=236(x), r1=15(y), r2=18(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 15
LDI r2, 18
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
