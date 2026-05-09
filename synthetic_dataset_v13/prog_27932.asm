; DESCRIPTION: Draws a black rectangle at (39, 25) with width 44 and height 30.
; PLAN: r0=39(x), r1=25(y), r2=44(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 25
LDI r2, 44
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
