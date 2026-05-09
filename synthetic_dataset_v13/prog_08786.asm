; DESCRIPTION: Draws a black rectangle at (103, 56) with width 23 and height 108.
; PLAN: r0=103(x), r1=56(y), r2=23(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 56
LDI r2, 23
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
