; DESCRIPTION: Draws a black rectangle at (301, 98) with width 35 and height 23.
; PLAN: r0=301(x), r1=98(y), r2=35(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 98
LDI r2, 35
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
