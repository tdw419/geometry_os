; DESCRIPTION: Draws a blue rectangle at (253, 75) with width 21 and height 50.
; PLAN: r0=253(x), r1=75(y), r2=21(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 75
LDI r2, 21
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
