; DESCRIPTION: Places a magenta 59x49 rectangle at position (251, 194).
; PLAN: r0=251(x), r1=194(y), r2=59(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 194
LDI r2, 59
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
