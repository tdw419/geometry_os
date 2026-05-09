; DESCRIPTION: Draws a green rectangle at (34, 16) with width 72 and height 105.
; PLAN: r0=34(x), r1=16(y), r2=72(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 16
LDI r2, 72
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
