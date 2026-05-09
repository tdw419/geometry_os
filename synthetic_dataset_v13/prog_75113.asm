; DESCRIPTION: Places a magenta 30x78 rectangle at position (226, 34).
; PLAN: r0=226(x), r1=34(y), r2=30(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 34
LDI r2, 30
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
