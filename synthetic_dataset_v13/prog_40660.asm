; DESCRIPTION: Places a magenta 66x83 rectangle at position (78, 170).
; PLAN: r0=78(x), r1=170(y), r2=66(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 170
LDI r2, 66
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
