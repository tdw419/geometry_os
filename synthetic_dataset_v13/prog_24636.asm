; DESCRIPTION: Draws a blue rectangle at (404, 72) with width 30 and height 98.
; PLAN: r0=404(x), r1=72(y), r2=30(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 72
LDI r2, 30
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
