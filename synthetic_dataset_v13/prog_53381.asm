; DESCRIPTION: Draws a black rectangle at (234, 120) with width 105 and height 32.
; PLAN: r0=234(x), r1=120(y), r2=105(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 120
LDI r2, 105
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
