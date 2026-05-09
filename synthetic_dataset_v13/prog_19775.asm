; DESCRIPTION: Draws a orange rectangle at (330, 96) with width 81 and height 105.
; PLAN: r0=330(x), r1=96(y), r2=81(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 96
LDI r2, 81
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
