; DESCRIPTION: Draws a orange rectangle at (93, 188) with width 96 and height 59.
; PLAN: r0=93(x), r1=188(y), r2=96(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 188
LDI r2, 96
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
