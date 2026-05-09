; DESCRIPTION: Draws a blue rectangle at (99, 231) with width 36 and height 24.
; PLAN: r0=99(x), r1=231(y), r2=36(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 231
LDI r2, 36
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
