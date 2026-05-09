; DESCRIPTION: Draws a black rectangle at (111, 56) with width 120 and height 22.
; PLAN: r0=111(x), r1=56(y), r2=120(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 56
LDI r2, 120
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
