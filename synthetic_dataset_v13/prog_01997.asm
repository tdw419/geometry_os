; DESCRIPTION: Draws a black rectangle at (150, 117) with width 101 and height 82.
; PLAN: r0=150(x), r1=117(y), r2=101(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 117
LDI r2, 101
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
