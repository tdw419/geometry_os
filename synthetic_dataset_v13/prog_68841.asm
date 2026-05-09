; DESCRIPTION: Draws a white rectangle at (352, 24) with width 98 and height 78.
; PLAN: r0=352(x), r1=24(y), r2=98(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 24
LDI r2, 98
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
