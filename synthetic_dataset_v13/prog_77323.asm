; DESCRIPTION: Draws a orange rectangle at (310, 15) with width 48 and height 117.
; PLAN: r0=310(x), r1=15(y), r2=48(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 15
LDI r2, 48
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
