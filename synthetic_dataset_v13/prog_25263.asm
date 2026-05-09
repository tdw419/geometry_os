; DESCRIPTION: Draws a black rectangle at (159, 149) with width 20 and height 14.
; PLAN: r0=159(x), r1=149(y), r2=20(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 149
LDI r2, 20
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
