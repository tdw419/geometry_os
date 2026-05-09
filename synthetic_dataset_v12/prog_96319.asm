; DESCRIPTION: Draws a orange rectangle at (131, 195) with width 103 and height 53.
; PLAN: r0=131(x), r1=195(y), r2=103(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 195
LDI r2, 103
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
