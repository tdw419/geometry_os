; DESCRIPTION: Draws a black rectangle at (298, 40) with width 63 and height 105.
; PLAN: r0=298(x), r1=40(y), r2=63(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 40
LDI r2, 63
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
