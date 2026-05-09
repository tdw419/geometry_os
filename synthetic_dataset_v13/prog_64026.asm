; DESCRIPTION: Draws a orange rectangle at (399, 111) with width 74 and height 76.
; PLAN: r0=399(x), r1=111(y), r2=74(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 111
LDI r2, 74
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
