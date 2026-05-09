; DESCRIPTION: Draws a white rectangle at (304, 123) with width 46 and height 92.
; PLAN: r0=304(x), r1=123(y), r2=46(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 123
LDI r2, 46
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
