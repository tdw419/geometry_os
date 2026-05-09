; DESCRIPTION: Places a magenta 12x89 rectangle at position (85, 68).
; PLAN: r0=85(x), r1=68(y), r2=12(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 68
LDI r2, 12
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
