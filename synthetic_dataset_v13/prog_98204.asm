; DESCRIPTION: Draws a blue rectangle at (102, 83) with width 76 and height 48.
; PLAN: r0=102(x), r1=83(y), r2=76(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 83
LDI r2, 76
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
