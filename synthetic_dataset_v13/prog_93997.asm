; DESCRIPTION: Draws a white rectangle at (182, 31) with width 40 and height 108.
; PLAN: r0=182(x), r1=31(y), r2=40(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 31
LDI r2, 40
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
