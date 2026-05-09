; DESCRIPTION: Draws a orange rectangle at (57, 0) with width 113 and height 31.
; PLAN: r0=57(x), r1=0(y), r2=113(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 0
LDI r2, 113
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
