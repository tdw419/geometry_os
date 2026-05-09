; DESCRIPTION: Draws a orange rectangle at (285, 122) with width 24 and height 103.
; PLAN: r0=285(x), r1=122(y), r2=24(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 122
LDI r2, 24
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
