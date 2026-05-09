; DESCRIPTION: Draws a orange rectangle at (287, 102) with width 92 and height 103.
; PLAN: r0=287(x), r1=102(y), r2=92(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 102
LDI r2, 92
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
