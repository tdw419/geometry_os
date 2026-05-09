; DESCRIPTION: Draws a black rectangle at (45, 128) with width 112 and height 117.
; PLAN: r0=45(x), r1=128(y), r2=112(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 128
LDI r2, 112
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
