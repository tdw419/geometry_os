; DESCRIPTION: Draws a blue rectangle at (403, 126) with width 81 and height 115.
; PLAN: r0=403(x), r1=126(y), r2=81(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 126
LDI r2, 81
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
