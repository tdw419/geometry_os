; DESCRIPTION: Draws a white rectangle at (136, 124) with width 103 and height 102.
; PLAN: r0=136(x), r1=124(y), r2=103(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 124
LDI r2, 103
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
