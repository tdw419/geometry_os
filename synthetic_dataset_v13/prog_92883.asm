; DESCRIPTION: Draws a blue rectangle at (335, 80) with width 32 and height 105.
; PLAN: r0=335(x), r1=80(y), r2=32(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 80
LDI r2, 32
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
