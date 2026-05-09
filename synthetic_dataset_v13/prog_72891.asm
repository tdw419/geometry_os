; DESCRIPTION: Draws a blue rectangle at (373, 93) with width 120 and height 118.
; PLAN: r0=373(x), r1=93(y), r2=120(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 93
LDI r2, 120
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
