; DESCRIPTION: Draws a white rectangle at (265, 20) with width 22 and height 103.
; PLAN: r0=265(x), r1=20(y), r2=22(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 20
LDI r2, 22
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
