; DESCRIPTION: Places a magenta 60x23 rectangle at position (81, 231).
; PLAN: r0=81(x), r1=231(y), r2=60(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 231
LDI r2, 60
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
