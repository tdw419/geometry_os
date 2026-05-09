; DESCRIPTION: Draws a black rectangle at (109, 28) with width 55 and height 94.
; PLAN: r0=109(x), r1=28(y), r2=55(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 28
LDI r2, 55
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
