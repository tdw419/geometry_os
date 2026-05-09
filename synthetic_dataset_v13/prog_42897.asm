; DESCRIPTION: Draws a black rectangle at (254, 46) with width 84 and height 120.
; PLAN: r0=254(x), r1=46(y), r2=84(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 46
LDI r2, 84
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
