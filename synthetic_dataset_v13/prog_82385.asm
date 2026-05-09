; DESCRIPTION: Draws a orange rectangle at (247, 51) with width 113 and height 27.
; PLAN: r0=247(x), r1=51(y), r2=113(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 51
LDI r2, 113
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
