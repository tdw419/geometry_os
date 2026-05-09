; DESCRIPTION: Places a magenta 26x70 rectangle at position (285, 79).
; PLAN: r0=285(x), r1=79(y), r2=26(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 79
LDI r2, 26
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
