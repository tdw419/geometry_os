; DESCRIPTION: Draws a white rectangle at (191, 68) with width 53 and height 47.
; PLAN: r0=191(x), r1=68(y), r2=53(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 68
LDI r2, 53
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
