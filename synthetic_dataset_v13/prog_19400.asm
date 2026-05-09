; DESCRIPTION: Draws a orange rectangle at (20, 96) with width 102 and height 86.
; PLAN: r0=20(x), r1=96(y), r2=102(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 96
LDI r2, 102
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
