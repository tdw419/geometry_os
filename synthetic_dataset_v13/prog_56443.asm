; DESCRIPTION: Draws a white rectangle at (313, 103) with width 107 and height 22.
; PLAN: r0=313(x), r1=103(y), r2=107(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 103
LDI r2, 107
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
