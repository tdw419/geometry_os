; DESCRIPTION: Places a magenta 18x57 rectangle at position (456, 77).
; PLAN: r0=456(x), r1=77(y), r2=18(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 77
LDI r2, 18
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
