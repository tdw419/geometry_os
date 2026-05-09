; DESCRIPTION: Places a magenta 88x95 rectangle at position (220, 85).
; PLAN: r0=220(x), r1=85(y), r2=88(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 85
LDI r2, 88
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
