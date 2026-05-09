; DESCRIPTION: Draws a black rectangle at (151, 50) with width 44 and height 119.
; PLAN: r0=151(x), r1=50(y), r2=44(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 50
LDI r2, 44
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
