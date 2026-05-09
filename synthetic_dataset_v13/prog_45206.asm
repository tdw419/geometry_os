; DESCRIPTION: Draws a orange rectangle at (131, 68) with width 36 and height 76.
; PLAN: r0=131(x), r1=68(y), r2=36(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 68
LDI r2, 36
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
