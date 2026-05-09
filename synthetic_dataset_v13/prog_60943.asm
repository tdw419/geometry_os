; DESCRIPTION: Draws a blue rectangle at (407, 177) with width 76 and height 61.
; PLAN: r0=407(x), r1=177(y), r2=76(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 177
LDI r2, 76
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
