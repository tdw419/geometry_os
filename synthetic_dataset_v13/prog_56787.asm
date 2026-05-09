; DESCRIPTION: Draws a black rectangle at (39, 79) with width 99 and height 12.
; PLAN: r0=39(x), r1=79(y), r2=99(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 79
LDI r2, 99
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
