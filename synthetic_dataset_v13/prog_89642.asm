; DESCRIPTION: Draws a blue rectangle at (180, 92) with width 12 and height 59.
; PLAN: r0=180(x), r1=92(y), r2=12(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 92
LDI r2, 12
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
