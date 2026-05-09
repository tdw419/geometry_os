; DESCRIPTION: Draws a orange rectangle at (419, 56) with width 93 and height 92.
; PLAN: r0=419(x), r1=56(y), r2=93(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 56
LDI r2, 93
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
