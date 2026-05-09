; DESCRIPTION: Draws a blue rectangle at (308, 108) with width 83 and height 108.
; PLAN: r0=308(x), r1=108(y), r2=83(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 108
LDI r2, 83
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
