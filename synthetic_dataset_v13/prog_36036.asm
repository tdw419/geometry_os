; DESCRIPTION: Draws a red rectangle at (217, 238) with width 39 and height 18.
; PLAN: r0=217(x), r1=238(y), r2=39(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 238
LDI r2, 39
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
