; DESCRIPTION: Draws a green rectangle at (255, 33) with width 92 and height 14.
; PLAN: r0=255(x), r1=33(y), r2=92(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 33
LDI r2, 92
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
