; DESCRIPTION: Draws a orange rectangle at (19, 92) with width 110 and height 45.
; PLAN: r0=19(x), r1=92(y), r2=110(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 92
LDI r2, 110
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
