; DESCRIPTION: Draws a orange rectangle at (343, 45) with width 93 and height 72.
; PLAN: r0=343(x), r1=45(y), r2=93(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 45
LDI r2, 93
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
