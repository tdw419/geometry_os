; DESCRIPTION: Draws a black rectangle at (237, 77) with width 117 and height 84.
; PLAN: r0=237(x), r1=77(y), r2=117(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 77
LDI r2, 117
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
