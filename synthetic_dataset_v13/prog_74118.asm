; DESCRIPTION: Draws a orange rectangle at (6, 59) with width 103 and height 89.
; PLAN: r0=6(x), r1=59(y), r2=103(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 59
LDI r2, 103
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
