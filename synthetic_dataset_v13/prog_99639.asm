; DESCRIPTION: Draws a white rectangle at (288, 10) with width 105 and height 102.
; PLAN: r0=288(x), r1=10(y), r2=105(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 10
LDI r2, 105
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
