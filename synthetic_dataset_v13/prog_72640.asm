; DESCRIPTION: Draws a orange rectangle at (199, 131) with width 62 and height 76.
; PLAN: r0=199(x), r1=131(y), r2=62(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 131
LDI r2, 62
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
