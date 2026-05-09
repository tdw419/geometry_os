; DESCRIPTION: Draws a white rectangle at (238, 43) with width 18 and height 27.
; PLAN: r0=238(x), r1=43(y), r2=18(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 43
LDI r2, 18
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
