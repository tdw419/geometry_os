; DESCRIPTION: Draws a white rectangle at (89, 67) with width 98 and height 100.
; PLAN: r0=89(x), r1=67(y), r2=98(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 67
LDI r2, 98
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
