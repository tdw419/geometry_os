; DESCRIPTION: Draws a white rectangle at (424, 67) with width 22 and height 93.
; PLAN: r0=424(x), r1=67(y), r2=22(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 67
LDI r2, 22
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
