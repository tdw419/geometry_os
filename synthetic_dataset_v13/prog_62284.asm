; DESCRIPTION: Draws a white rectangle at (104, 144) with width 67 and height 47.
; PLAN: r0=104(x), r1=144(y), r2=67(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 144
LDI r2, 67
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
