; DESCRIPTION: Draws a blue rectangle at (216, 208) with width 16 and height 48.
; PLAN: r0=216(x), r1=208(y), r2=16(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 208
LDI r2, 16
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
