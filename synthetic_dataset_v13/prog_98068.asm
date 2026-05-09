; DESCRIPTION: Draws a black rectangle at (237, 179) with width 100 and height 23.
; PLAN: r0=237(x), r1=179(y), r2=100(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 179
LDI r2, 100
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
