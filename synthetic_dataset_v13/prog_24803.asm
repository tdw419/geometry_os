; DESCRIPTION: Draws a blue rectangle at (103, 171) with width 30 and height 78.
; PLAN: r0=103(x), r1=171(y), r2=30(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 171
LDI r2, 30
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
