; DESCRIPTION: Draws a blue rectangle at (403, 176) with width 68 and height 55.
; PLAN: r0=403(x), r1=176(y), r2=68(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 176
LDI r2, 68
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
