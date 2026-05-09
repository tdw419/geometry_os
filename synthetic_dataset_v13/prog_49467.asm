; DESCRIPTION: Places a magenta 85x100 rectangle at position (86, 14).
; PLAN: r0=86(x), r1=14(y), r2=85(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 14
LDI r2, 85
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
