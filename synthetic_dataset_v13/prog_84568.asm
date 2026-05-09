; DESCRIPTION: Draws a white rectangle at (67, 24) with width 104 and height 111.
; PLAN: r0=67(x), r1=24(y), r2=104(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 24
LDI r2, 104
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
