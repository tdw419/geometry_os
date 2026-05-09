; DESCRIPTION: Draws a orange rectangle at (57, 106) with width 92 and height 76.
; PLAN: r0=57(x), r1=106(y), r2=92(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 106
LDI r2, 92
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
