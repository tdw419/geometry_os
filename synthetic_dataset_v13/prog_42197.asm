; DESCRIPTION: Draws a white rectangle at (352, 166) with width 102 and height 71.
; PLAN: r0=352(x), r1=166(y), r2=102(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 166
LDI r2, 102
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
