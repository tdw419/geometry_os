; DESCRIPTION: Draws a green rectangle at (240, 31) with width 46 and height 86.
; PLAN: r0=240(x), r1=31(y), r2=46(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 31
LDI r2, 46
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
