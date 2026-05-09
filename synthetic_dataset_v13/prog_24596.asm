; DESCRIPTION: Draws a white rectangle at (183, 58) with width 100 and height 33.
; PLAN: r0=183(x), r1=58(y), r2=100(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 58
LDI r2, 100
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
