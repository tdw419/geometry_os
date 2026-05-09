; DESCRIPTION: Places a magenta 94x67 rectangle at position (268, 179).
; PLAN: r0=268(x), r1=179(y), r2=94(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 179
LDI r2, 94
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
