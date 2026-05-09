; DESCRIPTION: Draws a white rectangle at (126, 178) with width 77 and height 36.
; PLAN: r0=126(x), r1=178(y), r2=77(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 178
LDI r2, 77
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
