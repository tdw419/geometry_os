; DESCRIPTION: Draws a white rectangle at (430, 51) with width 59 and height 48.
; PLAN: r0=430(x), r1=51(y), r2=59(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 51
LDI r2, 59
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
