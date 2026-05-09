; DESCRIPTION: Draws a orange rectangle at (279, 140) with width 99 and height 83.
; PLAN: r0=279(x), r1=140(y), r2=99(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 140
LDI r2, 99
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
