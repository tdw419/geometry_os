; DESCRIPTION: Draws a blue rectangle at (99, 48) with width 36 and height 92.
; PLAN: r0=99(x), r1=48(y), r2=36(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 48
LDI r2, 36
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
