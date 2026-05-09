; DESCRIPTION: Draws a blue rectangle at (150, 48) with width 71 and height 100.
; PLAN: r0=150(x), r1=48(y), r2=71(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 48
LDI r2, 71
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
