; DESCRIPTION: Draws a blue rectangle at (92, 75) with width 85 and height 105.
; PLAN: r0=92(x), r1=75(y), r2=85(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 75
LDI r2, 85
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
