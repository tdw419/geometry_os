; DESCRIPTION: Draws a blue rectangle at (335, 99) with width 85 and height 71.
; PLAN: r0=335(x), r1=99(y), r2=85(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 99
LDI r2, 85
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
