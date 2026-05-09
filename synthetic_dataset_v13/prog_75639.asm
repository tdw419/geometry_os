; DESCRIPTION: Draws a magenta rectangle at (400, 93) with width 80 and height 61.
; PLAN: r0=400(x), r1=93(y), r2=80(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 93
LDI r2, 80
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
