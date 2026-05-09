; DESCRIPTION: Draws a black rectangle at (217, 2) with width 76 and height 63.
; PLAN: r0=217(x), r1=2(y), r2=76(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 2
LDI r2, 76
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
