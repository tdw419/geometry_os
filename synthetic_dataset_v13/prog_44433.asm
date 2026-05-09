; DESCRIPTION: Draws a white rectangle at (117, 51) with width 71 and height 48.
; PLAN: r0=117(x), r1=51(y), r2=71(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 51
LDI r2, 71
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
