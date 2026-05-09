; DESCRIPTION: Draws a white rectangle at (31, 103) with width 108 and height 92.
; PLAN: r0=31(x), r1=103(y), r2=108(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 103
LDI r2, 108
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
