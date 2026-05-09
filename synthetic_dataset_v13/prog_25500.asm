; DESCRIPTION: Draws a blue rectangle at (321, 194) with width 116 and height 59.
; PLAN: r0=321(x), r1=194(y), r2=116(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 194
LDI r2, 116
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
