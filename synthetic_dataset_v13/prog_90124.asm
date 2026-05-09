; DESCRIPTION: Draws a white rectangle at (293, 35) with width 34 and height 102.
; PLAN: r0=293(x), r1=35(y), r2=34(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 35
LDI r2, 34
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
