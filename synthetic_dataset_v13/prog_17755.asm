; DESCRIPTION: Draws a orange rectangle at (282, 35) with width 91 and height 57.
; PLAN: r0=282(x), r1=35(y), r2=91(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 35
LDI r2, 91
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
