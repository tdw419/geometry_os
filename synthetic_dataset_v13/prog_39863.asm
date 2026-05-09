; DESCRIPTION: Draws a blue rectangle at (168, 50) with width 16 and height 118.
; PLAN: r0=168(x), r1=50(y), r2=16(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 50
LDI r2, 16
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
