; DESCRIPTION: Draws a green rectangle at (278, 11) with width 48 and height 59.
; PLAN: r0=278(x), r1=11(y), r2=48(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 11
LDI r2, 48
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
