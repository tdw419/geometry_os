; DESCRIPTION: Draws a blue rectangle at (198, 138) with width 24 and height 90.
; PLAN: r0=198(x), r1=138(y), r2=24(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 138
LDI r2, 24
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
