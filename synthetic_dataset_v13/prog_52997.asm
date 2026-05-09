; DESCRIPTION: Draws a orange rectangle at (96, 135) with width 64 and height 12.
; PLAN: r0=96(x), r1=135(y), r2=64(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 135
LDI r2, 64
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
