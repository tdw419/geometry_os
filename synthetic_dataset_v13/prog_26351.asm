; DESCRIPTION: Draws a black rectangle at (174, 131) with width 53 and height 13.
; PLAN: r0=174(x), r1=131(y), r2=53(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 131
LDI r2, 53
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
