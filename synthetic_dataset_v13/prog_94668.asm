; DESCRIPTION: Draws a blue rectangle at (307, 94) with width 95 and height 10.
; PLAN: r0=307(x), r1=94(y), r2=95(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 94
LDI r2, 95
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
