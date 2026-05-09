; DESCRIPTION: Draws a red rectangle at (291, 105) with width 45 and height 44.
; PLAN: r0=291(x), r1=105(y), r2=45(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 105
LDI r2, 45
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
