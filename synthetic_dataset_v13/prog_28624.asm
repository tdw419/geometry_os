; DESCRIPTION: Draws a black rectangle at (1, 16) with width 39 and height 79.
; PLAN: r0=1(x), r1=16(y), r2=39(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 16
LDI r2, 39
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
