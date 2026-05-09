; DESCRIPTION: Draws a orange rectangle at (127, 59) with width 43 and height 60.
; PLAN: r0=127(x), r1=59(y), r2=43(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 59
LDI r2, 43
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
