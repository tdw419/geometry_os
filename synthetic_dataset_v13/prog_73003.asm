; DESCRIPTION: Places a magenta 70x52 rectangle at position (14, 64).
; PLAN: r0=14(x), r1=64(y), r2=70(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 64
LDI r2, 70
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
