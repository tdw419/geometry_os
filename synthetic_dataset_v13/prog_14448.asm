; DESCRIPTION: Draws a orange rectangle at (465, 113) with width 47 and height 109.
; PLAN: r0=465(x), r1=113(y), r2=47(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 113
LDI r2, 47
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
