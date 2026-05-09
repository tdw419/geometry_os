; DESCRIPTION: Draws a orange rectangle at (143, 64) with width 114 and height 46.
; PLAN: r0=143(x), r1=64(y), r2=114(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 64
LDI r2, 114
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
