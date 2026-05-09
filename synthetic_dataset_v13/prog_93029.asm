; DESCRIPTION: Draws a green rectangle at (289, 210) with width 61 and height 30.
; PLAN: r0=289(x), r1=210(y), r2=61(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 210
LDI r2, 61
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
