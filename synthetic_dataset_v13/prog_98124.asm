; DESCRIPTION: Draws a white rectangle at (26, 117) with width 92 and height 100.
; PLAN: r0=26(x), r1=117(y), r2=92(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 117
LDI r2, 92
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
