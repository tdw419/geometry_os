; DESCRIPTION: Draws a white rectangle at (412, 12) with width 73 and height 104.
; PLAN: r0=412(x), r1=12(y), r2=73(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 12
LDI r2, 73
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
