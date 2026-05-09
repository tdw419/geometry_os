; DESCRIPTION: Places a magenta 81x110 rectangle at position (360, 0).
; PLAN: r0=360(x), r1=0(y), r2=81(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 0
LDI r2, 81
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
