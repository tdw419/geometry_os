; DESCRIPTION: Draws a white rectangle at (153, 98) with width 29 and height 101.
; PLAN: r0=153(x), r1=98(y), r2=29(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 98
LDI r2, 29
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
