; DESCRIPTION: Draws a blue rectangle at (328, 153) with width 34 and height 80.
; PLAN: r0=328(x), r1=153(y), r2=34(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 153
LDI r2, 34
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
