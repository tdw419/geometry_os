; DESCRIPTION: Draws a black rectangle at (234, 56) with width 97 and height 56.
; PLAN: r0=234(x), r1=56(y), r2=97(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 56
LDI r2, 97
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
