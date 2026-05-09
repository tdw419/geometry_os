; DESCRIPTION: Draws a black rectangle at (45, 102) with width 87 and height 52.
; PLAN: r0=45(x), r1=102(y), r2=87(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 102
LDI r2, 87
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
