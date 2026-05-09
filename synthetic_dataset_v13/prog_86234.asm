; DESCRIPTION: Draws a black rectangle at (405, 84) with width 25 and height 21.
; PLAN: r0=405(x), r1=84(y), r2=25(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 84
LDI r2, 25
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
