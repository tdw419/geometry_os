; DESCRIPTION: Draws a blue rectangle at (103, 200) with width 117 and height 13.
; PLAN: r0=103(x), r1=200(y), r2=117(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 200
LDI r2, 117
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
