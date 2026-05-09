; DESCRIPTION: Places a magenta 86x20 rectangle at position (231, 45).
; PLAN: r0=231(x), r1=45(y), r2=86(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 45
LDI r2, 86
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
