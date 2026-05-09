; DESCRIPTION: Draws a orange rectangle at (35, 210) with width 82 and height 44.
; PLAN: r0=35(x), r1=210(y), r2=82(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 210
LDI r2, 82
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
