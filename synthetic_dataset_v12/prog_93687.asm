; DESCRIPTION: Places a magenta 47x93 rectangle at position (200, 77).
; PLAN: r0=200(x), r1=77(y), r2=47(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 77
LDI r2, 47
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
