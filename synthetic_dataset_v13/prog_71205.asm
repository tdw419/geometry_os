; DESCRIPTION: Draws a orange rectangle at (102, 131) with width 12 and height 60.
; PLAN: r0=102(x), r1=131(y), r2=12(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 131
LDI r2, 12
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
