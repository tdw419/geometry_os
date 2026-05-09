; DESCRIPTION: Draws a black rectangle at (461, 117) with width 45 and height 68.
; PLAN: r0=461(x), r1=117(y), r2=45(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 117
LDI r2, 45
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
