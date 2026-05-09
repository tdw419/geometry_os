; DESCRIPTION: Draws a green rectangle at (446, 9) with width 29 and height 96.
; PLAN: r0=446(x), r1=9(y), r2=29(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 9
LDI r2, 29
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
