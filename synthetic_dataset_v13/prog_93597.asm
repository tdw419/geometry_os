; DESCRIPTION: Draws a blue rectangle at (21, 208) with width 18 and height 47.
; PLAN: r0=21(x), r1=208(y), r2=18(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 208
LDI r2, 18
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
