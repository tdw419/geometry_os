; DESCRIPTION: Draws a red rectangle at (165, 9) with width 113 and height 99.
; PLAN: r0=165(x), r1=9(y), r2=113(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 9
LDI r2, 113
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
