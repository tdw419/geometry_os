; DESCRIPTION: Draws a orange rectangle at (383, 111) with width 92 and height 89.
; PLAN: r0=383(x), r1=111(y), r2=92(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 111
LDI r2, 92
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
