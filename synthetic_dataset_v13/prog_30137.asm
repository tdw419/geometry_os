; DESCRIPTION: Draws a white rectangle at (403, 141) with width 67 and height 24.
; PLAN: r0=403(x), r1=141(y), r2=67(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 141
LDI r2, 67
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
