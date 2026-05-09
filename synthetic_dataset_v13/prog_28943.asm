; DESCRIPTION: Draws a white rectangle at (126, 14) with width 101 and height 102.
; PLAN: r0=126(x), r1=14(y), r2=101(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 14
LDI r2, 101
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
