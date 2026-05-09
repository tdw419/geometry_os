; DESCRIPTION: Places a magenta 109x84 rectangle at position (168, 97).
; PLAN: r0=168(x), r1=97(y), r2=109(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 97
LDI r2, 109
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
