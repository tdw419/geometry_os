; DESCRIPTION: Draws a cyan rectangle at (84, 148) with width 111 and height 54.
; PLAN: r0=84(x), r1=148(y), r2=111(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 148
LDI r2, 111
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
