; DESCRIPTION: Draws a blue rectangle at (403, 39) with width 81 and height 47.
; PLAN: r0=403(x), r1=39(y), r2=81(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 39
LDI r2, 81
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
