; DESCRIPTION: Draws a black rectangle at (123, 17) with width 77 and height 105.
; PLAN: r0=123(x), r1=17(y), r2=77(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 17
LDI r2, 77
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
