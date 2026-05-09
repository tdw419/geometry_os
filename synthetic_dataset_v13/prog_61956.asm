; DESCRIPTION: Draws a orange rectangle at (151, 20) with width 113 and height 66.
; PLAN: r0=151(x), r1=20(y), r2=113(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 20
LDI r2, 113
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
