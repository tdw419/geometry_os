; DESCRIPTION: Draws a yellow rectangle at (361, 131) with width 26 and height 28.
; PLAN: r0=361(x), r1=131(y), r2=26(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 131
LDI r2, 26
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
