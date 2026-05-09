; DESCRIPTION: Draws a white rectangle at (161, 32) with width 112 and height 104.
; PLAN: r0=161(x), r1=32(y), r2=112(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 32
LDI r2, 112
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
