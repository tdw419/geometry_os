; DESCRIPTION: Places a magenta 66x67 rectangle at position (60, 45).
; PLAN: r0=60(x), r1=45(y), r2=66(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 45
LDI r2, 66
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
