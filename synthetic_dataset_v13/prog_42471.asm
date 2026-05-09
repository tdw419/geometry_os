; DESCRIPTION: Draws a cyan rectangle at (289, 115) with width 15 and height 37.
; PLAN: r0=289(x), r1=115(y), r2=15(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 115
LDI r2, 15
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
