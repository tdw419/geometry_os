; DESCRIPTION: Draws a blue rectangle at (404, 5) with width 61 and height 119.
; PLAN: r0=404(x), r1=5(y), r2=61(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 5
LDI r2, 61
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
