; DESCRIPTION: Draws a black rectangle at (305, 99) with width 112 and height 63.
; PLAN: r0=305(x), r1=99(y), r2=112(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 99
LDI r2, 112
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
