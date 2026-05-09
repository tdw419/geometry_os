; DESCRIPTION: Draws a black rectangle at (151, 9) with width 83 and height 32.
; PLAN: r0=151(x), r1=9(y), r2=83(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 9
LDI r2, 83
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
