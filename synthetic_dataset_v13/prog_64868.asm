; DESCRIPTION: Places a magenta 32x98 rectangle at position (99, 30).
; PLAN: r0=99(x), r1=30(y), r2=32(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 30
LDI r2, 32
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
