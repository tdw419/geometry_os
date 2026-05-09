; DESCRIPTION: Draws a black rectangle at (89, 16) with width 24 and height 38.
; PLAN: r0=89(x), r1=16(y), r2=24(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 16
LDI r2, 24
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
