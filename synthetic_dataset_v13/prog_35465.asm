; DESCRIPTION: Draws a orange rectangle at (240, 39) with width 12 and height 44.
; PLAN: r0=240(x), r1=39(y), r2=12(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 39
LDI r2, 12
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
