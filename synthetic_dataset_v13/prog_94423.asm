; DESCRIPTION: Draws a green rectangle at (315, 53) with width 27 and height 92.
; PLAN: r0=315(x), r1=53(y), r2=27(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 53
LDI r2, 27
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
