; DESCRIPTION: Draws a black rectangle at (388, 56) with width 22 and height 57.
; PLAN: r0=388(x), r1=56(y), r2=22(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 56
LDI r2, 22
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
