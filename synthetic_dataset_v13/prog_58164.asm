; DESCRIPTION: Draws a black rectangle at (326, 1) with width 117 and height 79.
; PLAN: r0=326(x), r1=1(y), r2=117(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 1
LDI r2, 117
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
