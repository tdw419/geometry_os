; DESCRIPTION: Draws a orange rectangle at (341, 2) with width 84 and height 25.
; PLAN: r0=341(x), r1=2(y), r2=84(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 2
LDI r2, 84
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
