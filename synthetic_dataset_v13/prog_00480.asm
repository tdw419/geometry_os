; DESCRIPTION: Draws a black rectangle at (360, 132) with width 90 and height 24.
; PLAN: r0=360(x), r1=132(y), r2=90(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 132
LDI r2, 90
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
