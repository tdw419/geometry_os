; DESCRIPTION: Draws a blue rectangle at (328, 58) with width 52 and height 55.
; PLAN: r0=328(x), r1=58(y), r2=52(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 58
LDI r2, 52
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
