; DESCRIPTION: Places a magenta 47x42 rectangle at position (78, 205).
; PLAN: r0=78(x), r1=205(y), r2=47(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 205
LDI r2, 47
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
