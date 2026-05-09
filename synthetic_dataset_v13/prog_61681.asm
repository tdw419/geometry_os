; DESCRIPTION: Draws a orange rectangle at (33, 131) with width 19 and height 90.
; PLAN: r0=33(x), r1=131(y), r2=19(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 131
LDI r2, 19
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
