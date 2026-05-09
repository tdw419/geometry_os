; DESCRIPTION: Draws a white rectangle at (244, 108) with width 67 and height 28.
; PLAN: r0=244(x), r1=108(y), r2=67(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 108
LDI r2, 67
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
