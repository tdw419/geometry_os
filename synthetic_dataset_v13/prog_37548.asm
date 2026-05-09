; DESCRIPTION: Draws a white rectangle at (289, 8) with width 28 and height 51.
; PLAN: r0=289(x), r1=8(y), r2=28(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 8
LDI r2, 28
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
