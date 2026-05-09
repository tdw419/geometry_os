; DESCRIPTION: Draws a white rectangle at (352, 75) with width 25 and height 58.
; PLAN: r0=352(x), r1=75(y), r2=25(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 75
LDI r2, 25
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
