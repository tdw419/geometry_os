; DESCRIPTION: Draws a blue rectangle at (301, 145) with width 116 and height 109.
; PLAN: r0=301(x), r1=145(y), r2=116(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 145
LDI r2, 116
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
