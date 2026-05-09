; DESCRIPTION: Draws a blue rectangle at (9, 99) with width 82 and height 36.
; PLAN: r0=9(x), r1=99(y), r2=82(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 99
LDI r2, 82
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
