; DESCRIPTION: Draws a black rectangle at (449, 36) with width 62 and height 53.
; PLAN: r0=449(x), r1=36(y), r2=62(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 36
LDI r2, 62
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
