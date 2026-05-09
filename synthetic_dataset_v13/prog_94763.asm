; DESCRIPTION: Places a magenta 32x14 rectangle at position (334, 66).
; PLAN: r0=334(x), r1=66(y), r2=32(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 66
LDI r2, 32
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
