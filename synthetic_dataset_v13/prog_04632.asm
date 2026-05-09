; DESCRIPTION: Draws a white rectangle at (99, 22) with width 111 and height 94.
; PLAN: r0=99(x), r1=22(y), r2=111(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 22
LDI r2, 111
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
