; DESCRIPTION: Draws a black rectangle at (176, 65) with width 24 and height 112.
; PLAN: r0=176(x), r1=65(y), r2=24(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 65
LDI r2, 24
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
