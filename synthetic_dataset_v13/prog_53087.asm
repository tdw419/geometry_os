; DESCRIPTION: Draws a white rectangle at (352, 112) with width 108 and height 73.
; PLAN: r0=352(x), r1=112(y), r2=108(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 112
LDI r2, 108
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
