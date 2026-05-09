; DESCRIPTION: Draws a black rectangle at (340, 18) with width 100 and height 63.
; PLAN: r0=340(x), r1=18(y), r2=100(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 18
LDI r2, 100
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
