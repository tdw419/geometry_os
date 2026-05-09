; DESCRIPTION: Draws a white rectangle at (457, 98) with width 47 and height 119.
; PLAN: r0=457(x), r1=98(y), r2=47(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 98
LDI r2, 47
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
