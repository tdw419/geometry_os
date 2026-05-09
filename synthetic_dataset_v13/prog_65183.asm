; DESCRIPTION: Draws a white rectangle at (39, 117) with width 51 and height 34.
; PLAN: r0=39(x), r1=117(y), r2=51(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 117
LDI r2, 51
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
