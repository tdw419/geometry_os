; DESCRIPTION: Draws a blue rectangle at (31, 0) with width 36 and height 103.
; PLAN: r0=31(x), r1=0(y), r2=36(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 0
LDI r2, 36
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
