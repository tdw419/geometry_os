; DESCRIPTION: Draws a white rectangle at (148, 103) with width 19 and height 80.
; PLAN: r0=148(x), r1=103(y), r2=19(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 103
LDI r2, 19
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
