; DESCRIPTION: Draws a black rectangle at (256, 110) with width 98 and height 100.
; PLAN: r0=256(x), r1=110(y), r2=98(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 110
LDI r2, 98
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
