; DESCRIPTION: Places a magenta 118x20 rectangle at position (285, 136).
; PLAN: r0=285(x), r1=136(y), r2=118(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 136
LDI r2, 118
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
