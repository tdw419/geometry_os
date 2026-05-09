; DESCRIPTION: Draws a white rectangle at (19, 53) with width 102 and height 13.
; PLAN: r0=19(x), r1=53(y), r2=102(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 53
LDI r2, 102
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
