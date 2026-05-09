; DESCRIPTION: Draws a orange rectangle at (46, 170) with width 59 and height 60.
; PLAN: r0=46(x), r1=170(y), r2=59(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 170
LDI r2, 59
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
