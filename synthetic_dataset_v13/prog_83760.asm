; DESCRIPTION: Draws a orange rectangle at (102, 179) with width 60 and height 76.
; PLAN: r0=102(x), r1=179(y), r2=60(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 179
LDI r2, 60
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
