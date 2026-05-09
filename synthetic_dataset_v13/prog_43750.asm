; DESCRIPTION: Draws a blue rectangle at (330, 124) with width 24 and height 90.
; PLAN: r0=330(x), r1=124(y), r2=24(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 124
LDI r2, 24
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
