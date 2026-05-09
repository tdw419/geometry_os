; DESCRIPTION: Draws a white rectangle at (198, 69) with width 27 and height 73.
; PLAN: r0=198(x), r1=69(y), r2=27(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 69
LDI r2, 27
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
