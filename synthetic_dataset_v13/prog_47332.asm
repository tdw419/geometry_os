; DESCRIPTION: Draws a white rectangle at (339, 33) with width 28 and height 109.
; PLAN: r0=339(x), r1=33(y), r2=28(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 33
LDI r2, 28
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
