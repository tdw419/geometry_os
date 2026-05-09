; DESCRIPTION: Draws a white rectangle at (4, 140) with width 36 and height 14.
; PLAN: r0=4(x), r1=140(y), r2=36(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 140
LDI r2, 36
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
