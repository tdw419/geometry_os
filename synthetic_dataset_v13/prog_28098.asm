; DESCRIPTION: Draws a orange rectangle at (348, 56) with width 112 and height 111.
; PLAN: r0=348(x), r1=56(y), r2=112(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 56
LDI r2, 112
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
