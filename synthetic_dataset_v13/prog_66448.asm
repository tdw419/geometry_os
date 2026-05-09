; DESCRIPTION: Draws a white rectangle at (382, 67) with width 103 and height 49.
; PLAN: r0=382(x), r1=67(y), r2=103(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 67
LDI r2, 103
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
