; DESCRIPTION: Draws a blue rectangle at (229, 92) with width 82 and height 25.
; PLAN: r0=229(x), r1=92(y), r2=82(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 92
LDI r2, 82
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
