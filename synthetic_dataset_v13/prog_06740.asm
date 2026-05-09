; DESCRIPTION: Draws a white rectangle at (11, 237) with width 92 and height 19.
; PLAN: r0=11(x), r1=237(y), r2=92(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 237
LDI r2, 92
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
