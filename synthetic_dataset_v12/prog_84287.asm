; DESCRIPTION: Places a magenta 83x81 rectangle at position (343, 90).
; PLAN: r0=343(x), r1=90(y), r2=83(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 90
LDI r2, 83
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
