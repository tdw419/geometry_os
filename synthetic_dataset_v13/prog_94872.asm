; DESCRIPTION: Draws a white rectangle at (161, 169) with width 67 and height 83.
; PLAN: r0=161(x), r1=169(y), r2=67(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 169
LDI r2, 67
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
