; DESCRIPTION: Places a magenta 81x14 rectangle at position (285, 199).
; PLAN: r0=285(x), r1=199(y), r2=81(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 199
LDI r2, 81
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
