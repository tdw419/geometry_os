; DESCRIPTION: Draws a cyan rectangle at (135, 136) with width 111 and height 90.
; PLAN: r0=135(x), r1=136(y), r2=111(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 136
LDI r2, 111
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
