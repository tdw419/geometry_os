; DESCRIPTION: Draws a yellow rectangle at (268, 132) with width 46 and height 76.
; PLAN: r0=268(x), r1=132(y), r2=46(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 132
LDI r2, 46
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
