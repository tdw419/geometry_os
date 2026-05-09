; DESCRIPTION: Draws a purple rectangle at (360, 120) with width 75 and height 103.
; PLAN: r0=360(x), r1=120(y), r2=75(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 120
LDI r2, 75
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
