; DESCRIPTION: Draws a green rectangle at (442, 7) with width 59 and height 55.
; PLAN: r0=442(x), r1=7(y), r2=59(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 7
LDI r2, 59
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
