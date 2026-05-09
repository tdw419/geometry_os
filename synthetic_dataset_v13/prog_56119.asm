; DESCRIPTION: Places a magenta 23x68 rectangle at position (117, 85).
; PLAN: r0=117(x), r1=85(y), r2=23(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 85
LDI r2, 23
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
