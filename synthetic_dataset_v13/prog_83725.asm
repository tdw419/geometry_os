; DESCRIPTION: Places a magenta 34x13 rectangle at position (115, 68).
; PLAN: r0=115(x), r1=68(y), r2=34(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 68
LDI r2, 34
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
