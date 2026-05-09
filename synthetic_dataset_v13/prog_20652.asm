; DESCRIPTION: Draws a black rectangle at (192, 85) with width 47 and height 96.
; PLAN: r0=192(x), r1=85(y), r2=47(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 85
LDI r2, 47
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
