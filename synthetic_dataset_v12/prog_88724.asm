; DESCRIPTION: Draws a white rectangle at (79, 135) with width 17 and height 18.
; PLAN: r0=79(x), r1=135(y), r2=17(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 135
LDI r2, 17
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
