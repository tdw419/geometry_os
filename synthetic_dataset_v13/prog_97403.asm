; DESCRIPTION: Draws a green rectangle at (404, 63) with width 95 and height 61.
; PLAN: r0=404(x), r1=63(y), r2=95(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 63
LDI r2, 95
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
