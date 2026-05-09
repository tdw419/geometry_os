; DESCRIPTION: Draws a white rectangle at (336, 34) with width 67 and height 109.
; PLAN: r0=336(x), r1=34(y), r2=67(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 34
LDI r2, 67
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
