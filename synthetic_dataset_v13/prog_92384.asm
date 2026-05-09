; DESCRIPTION: Draws a black rectangle at (361, 6) with width 53 and height 44.
; PLAN: r0=361(x), r1=6(y), r2=53(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 6
LDI r2, 53
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
