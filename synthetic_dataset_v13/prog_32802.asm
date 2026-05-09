; DESCRIPTION: Draws a white rectangle at (352, 34) with width 24 and height 106.
; PLAN: r0=352(x), r1=34(y), r2=24(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 34
LDI r2, 24
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
