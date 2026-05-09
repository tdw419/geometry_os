; DESCRIPTION: Draws a orange rectangle at (421, 108) with width 39 and height 93.
; PLAN: r0=421(x), r1=108(y), r2=39(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 108
LDI r2, 39
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
